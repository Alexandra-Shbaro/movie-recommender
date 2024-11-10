<?php

//headers 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Content-Type,Authorization');

$host ='localhost:3307';
$username= 'root';
$password='alexandra';
$db_name='movie_recommender';

$connection = new mysqli ($host,$username,$password,$db_name);

if ($connection->connect_error){
    die("Error happend");
}