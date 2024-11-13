<?php 

include "connection.php";

if (!isset($_GET['user_id'])){
    json_encode("success" => "false" , "message" => "no user id found");
}

$user_id = $_GET['user_id'];

$sql = 'SELECT user_id, username, email, isAdmin, isBanned  FROM user WHERE user_id=?'
$stmt= $connection->prepare($sql); 

$stmt = bind_param('i',$user_id); 
