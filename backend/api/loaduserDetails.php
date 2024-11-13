<?php
include("connection.php");

if (!isset($_GET["movie_id"]) || !isset($_GET['user_id'])) {
    echo json_encode(["success" => false, "message" => "Movie ID and User ID are required."]);
    exit();
}

$movie_id = $_GET['movie_id'];
$user_id = $_GET['user_id'];

// Main query to fetch user rating and bookmark status
$sql = $connection->prepare('
    SELECT 
        r.rating, 
        CASE WHEN b.user_id IS NOT NULL THEN 1 ELSE 0 END AS bookmark 
    FROM 
        user_rating r
    LEFT JOIN 
        user_bookmark b ON r.user_id = b.user_id AND r.movie_id = b.movie_id
    WHERE 
        r.movie_id = ? AND r.user_id = ?
');

$sql->bind_param('ii', $movie_id, $user_id);

if ($sql->execute()) {
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        $userdata = $result->fetch_assoc();
        
        // After fetching data, update `user_movie_metrics` to increment `user_clicks`
        $update_sql = $connection->prepare('
            INSERT INTO user_movie_metrics (movie_id, user_id, user_clicks) 
            VALUES (?, ?, 1) 
            ON DUPLICATE KEY UPDATE user_clicks = user_clicks + 1
        ');
        $update_sql->bind_param('ii', $movie_id, $user_id);
        $update_sql->execute();
        $update_sql->close();

        echo json_encode(["success" => true, "data" => $userdata]);
    } else {
        echo json_encode(["success" => false, "message" => "No records found"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Query execution failed"]);
}

$sql->close();
$connection->close();
