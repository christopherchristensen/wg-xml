<?php

$sourceFile = '../data/db.xml';
$tempFile = tempnam(sys_get_temp_dir(), 'db');

$xml = simplexml_load_file($sourceFile);

addWg($xml, [
    'name' => $_POST['name'] ?? 'Demo WG',
    'personen' => $_POST['personen'] ?? 4,
    'canton' => $_POST['canton'] ?? 'ZG'
]);

persistXML($tempFile, $xml);

$result = validateXML($tempFile);
if ($result == FALSE) {
    echo printErrors();
} else {
    rename($tempFile, $sourceFile);
    unlink($tempFile);

    header('Location: /wg/index.xml');
    exit();
}

function addWG($xml, $data) {
    $wgRoot = $xml->xpath('wgs')[0];

    $ids = array_map(function ($wg) {
        return intval($wg->attributes()['id']);
    }, $xml->xpath('wgs/wg'));
    $newId = max($ids) + 1;

    $node = $wgRoot->addChild('wg');
    $node->addAttribute('id', $newId);

    $node->addChild('name', $data['name']);
    $node->addChild('personen', $data['personen']);
    $node->addChild('canton', $data['canton']);
}

function persistXML($path, $xml) {
    file_put_contents($path, $xml->asXML());
}

function validateXML($path) {
    $data = file_get_contents($path);
    $xml = new DOMDocument();
    $xml->loadXML($data);

    libxml_use_internal_errors(true);

    $xsd = '../data/db.xsd';
    return $xml->schemaValidate($xsd);

}

function printErrors() {
    $errors = libxml_get_errors();
    $ret = array_map(function ($error) {
        return $error->message;
    }, $errors);
    libxml_clear_errors();
    return implode($ret, '</br>');
}

