<?php
include("connection.php");

// Get JSON input data
$input = json_decode(file_get_contents('php://input'), true);

if (!isset($input["movie_id"]) || !isset($input["user_time"])) {
    echo json_encode(["success" => false, "message" => "Movie ID and time spent are required."]);
    exit();
}

$movie_id = $input["movie_id"];
$user_time = $input["user_time"];
$user_id = $input["user_id"] ?? null; // Allow `user_id` to be null

// Update user_movie_metrics table if user_id is provided
if ($user_id !== null) {
    $user_metrics_sql = $connection->prepare('
        INSERT INTO user_movie_metrics (movie_id, user_id, user_time) 
        VALUES (?, ?, ?) 
        ON DUPLICATE KEY UPDATE user_time = user_time + VALUES(user_time)
    ');
    $user_metrics_sql->bind_param('iii', $movie_id, $user_id, $user_time);
    $user_metrics_sql->execute();
    $user_metrics_sql->close();
}

// Update movie_metrics table regardless of whether user_id exists
$movie_metrics_sql = $connection->prepare('
    INSERT INTO movie_metrics (movie_id, visit_time) 
    VALUES (?, ?) 
    ON DUPLICATE KEY UPDATE visit_time = visit_time + VALUES(visit_time)
');
$movie_metrics_sql->bind_param('ii', $movie_id, $user_time);
$movie_metrics_sql->execute();
$movie_metrics_sql->close();

$connection->close();

echo json_encode(["success" => true, "message" => "Time spent updated successfully"]);
