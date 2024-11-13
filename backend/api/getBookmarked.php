<?php
include("connection.php");

if (!isset($_GET["user_id"]) || empty($_GET["user_id"])) {
    echo json_encode(["success" => false, "message" => "User ID is required."]);
    exit();
}

$user_id = $_GET['user_id'];

$sql = $connection->prepare('
    SELECT movie_id
    FROM user_bookmark
    WHERE user_id = ?
');

$sql->bind_param('i', $user_id);

if ($sql->execute()) {
    $result = $sql->get_result();

    if ($result->num_rows > 0) {
        $movie_ids = [];
        while ($row = $result->fetch_assoc()) {
            $movie_ids[] = $row['movie_id'];
        }
        echo json_encode(["success" => true, "data" => $movie_ids]);
    } else {
        echo json_encode(["success" => true, "data" => []]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Query execution failed"]);
}

$sql->close();
$connection->close();
