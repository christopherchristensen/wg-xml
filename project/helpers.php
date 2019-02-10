<?php

function dbTransaction($dbFile, $callback) {
    // Load the xml file
    $xml = simplexml_load_file($dbFile);

    // Run the mutation
    $callback($xml);

    // Prepare validation
    $xsd = sprintf("%s.xsd", substr($dbFile, 0, -4));
    libxml_use_internal_errors(true);

    // Validate mutated xml
    $dom = new DOMDocument();
    $dom->loadXML($xml->asXML());
    $result = $dom->schemaValidate($xsd);

    // Overwrite file if no errors
    if ($result == TRUE) {
        file_put_contents($dbFile, $xml->asXML());
        return [];
    }

    // Return array with erros messages
    $errors = array_map(function ($error) {
        return $error->message;
    }, libxml_get_errors());
    libxml_clear_errors();
    return $errors;
}

function isValidWgId($xml, $wgId) {
    $ids = array_map(function ($wg) {
        return intval($wg->attributes()['id']);
    }, $xml->xpath('//wg'));

    return in_array($wgId, $ids);
}

function isValidContestId($xml, $contestId) {
    $ids = array_map(function ($contest) {
        return intval($contest->attributes()['id']);
    }, $xml->xpath('//contest'));

    return in_array($contestId, $ids);
}
