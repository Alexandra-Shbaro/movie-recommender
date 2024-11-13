<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$host = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "movie_recommender";

$connection = mysqli_connect($host, $dbuser, $dbpass, $dbname);

// Check connection
if (!$connection) {
    die(json_encode(["success" => false, "message" => "Database connection error: " . mysqli_connect_error()]));
}
