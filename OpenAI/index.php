<?php
// Allow requests from localhost
header("Access-Control-Allow-Origin: http://localhost");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// Replace with your actual OpenAI API key
$apiKey = " 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 ";
// Process the JSON request payload from the client
$requestPayload = file_get_contents("php://input");
$data = json_decode($requestPayload, true);

if (!$data || !isset($data["messages"])) {
    echo json_encode(["error" => "Invalid request. 'messages' is required."]);
    exit;
}

// Prepare data for OpenAI API request
$postData = json_encode([
    "model" => "gpt-3.5-turbo",
    "messages" => $data["messages"],
    "max_tokens" => 100
]);

// Set up cURL for the OpenAI API request
$ch = curl_init("https://api.openai.com/v1/chat/completions");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/json",
    "Authorization: Bearer " . $apiKey
]);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

// Execute cURL request
$response = curl_exec($ch);

if ($response === false) {
    echo json_encode(["error" => "Request failed: " . curl_error($ch)]);
    curl_close($ch);
    exit;
}

curl_close($ch);
echo $response;
?>
