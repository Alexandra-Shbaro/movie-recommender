<?php

include("connection.php");

if (isset($_GET["movie_id"]) && isset($_GET["user_id"]) && isset($_GET['bookmarked'])) {
    $movie_id = $_GET['movie_id'];
    $user_id = $_GET['user_id'];
    $bookmarked = $_GET['bookmarked'];

    if ($bookmarked == 0) {
        $time = date('Y-m-d H:i:s');
        
        $sql = $connection->prepare('INSERT INTO user_bookmark (user_id, movie_id, timestamp) VALUES (?, ?, ?)');
        
        $sql->bind_param('iis', $user_id, $movie_id, $time);

        if ($sql->execute()) {
            if ($sql->affected_rows > 0) {
                echo json_encode([
                    "success" => true,
                    "message" => "Bookmark added",
                ]);
            } else {
                http_response_code(404);
                echo json_encode([
                    "success" => false,
                    "message" => "Bookmark not created"
                ]);
            }
        } else {
            http_response_code(500);
            echo json_encode([
                "success" => false,
                "message" => "Failed to add bookmark"
            ]);
        }
    } 
    else {
        $sql = $connection->prepare('DELETE FROM user_bookmark WHERE movie_id = ? AND user_id = ?');
        
        
        $sql->bind_param('ii', $movie_id, $user_id);

        if ($sql->execute()) {
            if ($sql->affected_rows > 0) {
                echo json_encode([
                    "success" => true,
                    "message" => "Bookmark removed",
                ]);
            } else {
                http_response_code(404);
                echo json_encode([
                    "success" => false,
                    "message" => "Bookmark not found"
                ]);
            }
        } else {
            http_response_code(500);
            echo json_encode([
                "success" => false,
                "message" => "Failed to delete bookmark"
            ]);
        }
    }
} else {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid input"
    ]);
}
