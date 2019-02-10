<?php

require_once('../helpers.php');

$dbFile = '../data/db.xml';
$xml = simplexml_load_file($dbFile);

$contestId = $_GET['contest'] ?? 0;
$valid = isValidContestId($xml, $contestId);

if (!$valid) {
    header('HTTP/1.0 404 Not Found');
    echo "Invalid URL";
    exit();
}

header('Content-type: application/xml');
$result = $xml->xpath('//contest[@id = ' . $contestId . ']')[0];

?>
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
<?= $result->asXML() ?>
