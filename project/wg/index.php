<?php

require_once('../helpers.php');

$dbFile = '../data/db.xml';
$xml = simplexml_load_file($dbFile);

$wgId = $_GET['wg'] ?? 0;
$valid = isValidWgId($xml, $wgId);

if (!$valid) {
    header('HTTP/1.0 404 Not Found');
    echo "Invalid URL";
    exit();
}

$dbStr = vsprintf('%s%s<db>%s%s</db>', [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<?xml-stylesheet type="text/xsl" href="index.xsl"?>',
    $xml->xpath('//wg[@id = ' . $wgId . ']')[0]->asXML(),
    $xml->xpath('//contests')[0]->asXML()
]);

header('Content-type: application/xml');
$root = new SimpleXMLElement($dbStr);
?>
<?= $root->asXML() ?>
