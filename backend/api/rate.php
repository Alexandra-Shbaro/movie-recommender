<?php

include("connection.php");

if (isset($_GET["movie_id"]) && isset($_GET["user_id"]) && isset($_GET['rating'])) {
    $movie_id = $_GET['movie_id'];
    $user_id = $_GET['user_id'];
    $rating = $_GET['rating'];
    $time = date('Y-m-d H:i:s');

    $query = "
        INSERT INTO user_rating (user_id, movie_id, rating, timestamp)
        VALUES (?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
        rating = VALUES(rating), timestamp = VALUES(timestamp)
    ";

    $sql =$connection->prepare($query);

    $sql->bind_param("iiis", $user_id,$movie_id, $rating, $time);

    if ($sql->execute()) {
        if ($sql->affected_rows > 0) {
            echo json_encode([
                "success" => true,
                "message" => "Rating updated or created successfully",
            ]);
        } else {
            echo json_encode([
                "success" => false,
                "message" => "No change in rating",
            ]);
        }
    } else {
        http_response_code(500);
        echo json_encode([
            "success" => false,
            "message" => "Failed to execute SQL query",
        ]);
    }
} else {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid input",
    ]);
}
