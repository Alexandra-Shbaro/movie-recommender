<?php 

include "connection.php";

try{
    $input = file_get_contents("php://input");
    $data = json_decode($input, true);
//checking if fields are set
if (!isset($data['username']) || empty($data['username']) ||
    !isset($data['password']) || empty($data['password']) ||
    !isset($data['email']) || empty($data['email'])) {
    echo json_encode(["success" => false, "message" => "Please fill in all required fields."]);
    exit();
}

$username = $data['username'];
$password = password_hash($data['password'], PASSWORD_DEFAULT);
$email = $data['email'];

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["success" => false, "message" => "Invalid email format."]);
    exit();
}

$sql = "INSERT INTO user (username, password, email) VALUES (?, ?, ?)";

$stmt = $connection->prepare($sql);

if ($stmt === false) {
    echo json_encode(["success" => false, "message" => "Failed"]);
    exit();
}

$stmt->bind_param("sss", $username, $password, $email);

if ($stmt->execute()) {
    $userId = $connection->insert_id;
        echo json_encode([
            "success" => true,
            "message" => "User created successfully",
            "user_id" => $userId
        ]);
} else {
    echo json_encode(["success" => false, "message" => "Error creating user: " . $stmt->error]);
}

$stmt->close();
$connection->close();
}
catch (Exception $e) {
    echo json_encode(["message" => "Unexpected error"]);
}