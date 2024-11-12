<?php
include "connection.php";

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

try {
    // Check if fields are set and not empty
    if (!isset($_POST['username']) || empty($_POST['username']) ||
        !isset($_POST['email']) || empty($_POST['email']) ||
        !isset($_POST['password']) || empty($_POST['password'])) {
        echo json_encode(["success" => false, "message" => "Please fill in all required fields."]);
        exit();
    }

    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["success" => false, "message" => "Invalid email format."]);
        exit();
    }

    $sql = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
    $stmt = $connection->prepare($sql);

    if ($stmt === false) {
        echo json_encode(["success" => false, "message" => "Failed to prepare statement"]);
        exit();
    }

    $stmt->bind_param("sss", $username, $password, $email);

    if ($stmt->execute()) {
        $userId = $connection->insert_id;
        echo json_encode([
            "success" => true,
            "message" => "User created successfully",
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Error creating user: " . $stmt->error]);
    }

    $stmt->close();
    $connection->close();
} catch (Exception $e) {
    echo json_encode(["message" => "Unexpected error"]);
}
