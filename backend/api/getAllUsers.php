<?php
include("connection.php");

// Prepare the SQL query to select users where isAdmin = false
$sql = $connection->prepare('
   SELECT 
    u.user_id, 
    u.username, 
    u.email, 
    u.isAdmin, 
    u.isBanned,
    COUNT(ub.user_bookmark_id) AS bookmarks
FROM 
    user u
LEFT JOIN 
    user_bookmark ub 
ON 
    u.user_id = ub.user_id
WHERE 
    u.isAdmin = false
GROUP BY 
    u.user_id, u.username, u.email, u.isAdmin, u.isBanned;

');

if ($sql->execute()) {
    $result = $sql->get_result();

    // Check if any users were found
    if ($result->num_rows > 0) {
        $users = [];

        // Fetch all users into an array
        while ($row = $result->fetch_assoc()) {
            $users[] = $row;
        }

        // Return the users as a JSON response
        echo json_encode(["success" => true, "data" => $users]);
    } else {
        // No users found with isAdmin = false
        echo json_encode(["success" => false, "message" => "No users found"]);
    }
} else {
    // Handle query execution failure
    echo json_encode(["success" => false, "message" => "Query execution failed"]);
}

// Close the statement and database connection
$sql->close();
$connection->close();
