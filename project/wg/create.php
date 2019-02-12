<?php

require_once('../helpers.php');

$errors = addWg([
    'name' => $_POST['name'] ?? 'Demo WG',
    'personen' => $_POST['personen'] ?? 4,
    'canton' => $_POST['canton'] ?? 'ZG'
]);

if (count($errors) == 0) {
    header('Location: /index.xml#wg');
    exit();
} else {
    print_r($errors);
    exit();
}

function addWG($data) {
    return dbTransaction('../data/db.xml', function ($xml) use ($data) {
        // Get the wgs node from the db file
        $root = $xml->xpath('wgs')[0];

        // Calculate the id for the new wg
        $ids = array_map(function ($wg) {
            return intval($wg->attributes()['id']);
        }, $root->xpath('wg'));
        $newId = max($ids) + 1;

        // Create new wg noed
        $node = $root->addChild('wg');
        $node->addAttribute('id', $newId);
        $node->addChild('name', $data['name']);
        $node->addChild('personen', $data['personen']);
        $node->addChild('canton', $data['canton']);
    });
}
