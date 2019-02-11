<?php

require_once('../helpers.php');

$errors = addContest([
    'name' => $_POST['name'] ?? 'Demo Contest',
    'description' => $_POST['description'] ?? 'Nothing to be written about since this is only a demo text',
    'company' => $_POST['company'] ?? 'HSLU',
    'startDate' => $_POST['startDate'] ?? '2019-02-01',
    'endDate' => $_POST['endDate'] ?? '2019-05-01'
]);

if (count($errors) == 0) {
    header('Location: /contest/index.xml');
    exit();
} else {
    print_r($errors);
    exit();
}

function addContest($data) {
    return dbTransaction('../data/db.xml', function ($xml) use ($data) {
        // Get the wgs node from the db file
        $root = $xml->xpath('contests')[0];

        // Calculate the id for the new contest
        $ids = array_map(function ($contest) {
            return intval($contest->attributes()['id']);
        }, $root->xpath('contest'));
        $newId = max($ids) + 1;

        // Create new wg noed
        $node = $root->addChild('contest');
        $node->addAttribute('id', $newId);
        $node->addChild('name', $data['name']);
        $node->addChild('description', $data['description']);
        $node->addChild('company', $data['company']);
        $node->addChild('startDate', $data['startDate']);
        $node->addChild('endDate', $data['endDate']);
        $node->addChild('votes', null);
    });
}
