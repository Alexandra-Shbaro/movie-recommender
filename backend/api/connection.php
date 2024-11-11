<?php


$host = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "movie_recommender";

$connection=mysqli_connect($host, $dbuser, $dbpass, $dbname);
if ($connection->connect_error){
    die("Error connecting to database");
  }