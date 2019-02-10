<?php

require_once('../helpers.php');

$data = [
    'wgId' => $_GET['wg'] ?? 0,
    'contestId' => $_GET['contest'] ?? 0,
];

$errors = dbTransaction('../data/db.xml', function ($xml) use ($data) {
    $wgIds = array_map(function ($wg) {
        return intval($wg->attributes()['id']);
    }, $xml->xpath('//wg'));

    $contestIds = array_map(function ($wg) {
        return intval($wg->attributes()['id']);
    }, $xml->xpath('//contest'));

    $valid = in_array($data['wgId'], $wgIds) && in_array($data['wgId'], $wgIds);
    if (!$valid) {
        header('HTTP/1.0 404 Not Found');
        echo "Invalid URL";
        exit();
    }

    $wgVoteQuery = vsprintf('//contest[@id = %s]//vote[@wg = %s]', [
        $data['contestId'],
        $data['wgId'],
    ]);
    $wgVote = $xml->xpath($wgVoteQuery);

    if (count($wgVote) == 0) {
        $votesQuery = sprintf('//contest[@id = %s]/votes', $data['contestId']);
        $votesNode = $xml->xpath($votesQuery)[0];

        $node = $votesNode->addChild('vote', 1);
        $node->addAttribute('wg', $data['wgId']);
    } else {
        $votes = intval($wgVote[0]);
        $wgVote[0][0] = strval($votes + 1);
    }
});

if (count($errors) == 0) {
    echo 'Your vote has been saved';
} else {
    echo 'Uups, something went wrong';
}
