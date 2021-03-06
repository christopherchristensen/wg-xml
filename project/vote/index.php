<?php

require_once('../helpers.php');

$data = [
    'wgId' => $_GET['wg'] ?? 0,
    'contestId' => $_GET['contest'] ?? 0,
];

$errors = dbTransaction('../data/db.xml', function ($xml) use ($data) {
    $valid = isValidWgId($xml, $data['wgId']) && isValidContestId($xml, $data['contestId']);
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

$state = (count($errors) == 0) ? 'success' : 'error';
header('Content-type: application/xml');

?>
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="<?= $state ?>.xsl"?>
<contest id="<?= $data['contestId'] ?>"></contest>
