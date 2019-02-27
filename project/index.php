<?php

function path_join($base, $path) {
    return rtrim( $base, '/' ) . '/' . ltrim( $path, '/' );
}

$url = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']);
header('Location: ' . path_join($url, 'index.xml'));
