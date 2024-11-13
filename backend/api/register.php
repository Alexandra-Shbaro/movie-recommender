<?php
include "connection.php";

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json'); 

try {
    $input = file_get_contents("php://input");

    $data = json_decode($input, true);

    // Validate required fields
    if (!isset($data['username']) || empty($data['username']) ||
        !isset($data['email']) || empty($data['email']) ||
        !isset($data['password']) || empty($data['password'])) {
        echo json_encode(["success" => false, "message" => "Please fill in all required fields."]);
        exit();
    }

    $username = $data['username'];
    $email = $data['email'];

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["success" => false, "message" => "Invalid email format."]);
        exit();
    }

    // Hash the password
    $password = password_hash($data['password'], PASSWORD_DEFAULT); 

    // Prepare SQL statement to insert the user data
    $sql = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
    $stmt = $connection->prepare($sql);

    if ($stmt === false) {
        echo json_encode(["success" => false, "message" => "Failed to prepare statement"]);
        exit();
    }

    // Bind parameters and execute
    $stmt->bind_param("sss", $username, $email, $password);

    if ($stmt->execute()) {
        // Get the ID of the newly created user
        $user_id = $stmt->insert_id;

        echo json_encode([
            "success" => true,
            "message" => "User created successfully",
            "user_id" => $user_id
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Error creating user: " . $stmt->error]);
    }

    $stmt->close();
    $connection->close();
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Unexpected error"]);
}
?>
