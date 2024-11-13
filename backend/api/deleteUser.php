<?php

include "connection.php";

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

try {
    if (!isset($_POST['user_id'])) {
        echo json_encode(["success" => false, "message" => "Missing user_id"]);
        exit();
    }

    $user_id = $_POST['user_id'];

    $sql = "DELETE FROM user WHERE user_id = ?";
    $stmt = $connection->prepare($sql);

    if ($stmt === false) {
        echo json_encode(["success" => false, "message" => "Failed to prepare SQL statement"]);
        exit();
    }

    $stmt->bind_param("i", $user_id);
    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo json_encode(["success" => true, "message" => "User deleted successfully"]);
        } else {
            echo json_encode(["success" => false, "message" => "No user found to delete"]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Error deleting user: " . $stmt->error]);
    }

    $stmt->close();
    $connection->close();
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Unexpected error"]);
}

?>
