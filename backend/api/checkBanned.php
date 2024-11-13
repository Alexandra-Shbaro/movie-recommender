<?php
include("connection.php");

if (!isset($_GET["user_id"])) {
    echo json_encode(["success" => false, "message" => "User ID is required."]);
    exit();
}

$user_id = $_GET['user_id'];

$sql = $connection->prepare('
    SELECT username, isBanned
    FROM user
    WHERE user_id = ?
');

$sql->bind_param('i', $user_id);

if ($sql->execute()) {
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        $userdata = $result->fetch_assoc();
        if ($userdata['isBanned'] == 1) {
            echo json_encode(["success" => true, "data" => $userdata, "message" => "User is banned."]);
        } else {
            echo json_encode(["success" => true, "data" => $userdata, "message" => "User is not banned."]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "User not found."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Query execution failed"]);
}

$sql->close();
$connection->close();
?>
