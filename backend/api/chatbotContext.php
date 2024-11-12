<?php

include("connection.php");

$userId = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
$userData = [];

if ($userId > 0) {
    $sql = $connection->prepare('
        SELECT m.movie_name, r.rating, g.genre_name
        FROM user_rating r
        JOIN movie m ON r.movie_id = m.movie_id
        JOIN movie_genre mg ON m.movie_id = mg.movie_id
        JOIN genre g ON mg.genre_id = g.genre_id
        WHERE r.user_id = ?');
    $sql->bind_param('i', $userId);
    $sql->execute();
    $result = $sql->get_result();
    $userData['ratings'] = $result->fetch_all(MYSQLI_ASSOC);

    $sql = $connection->prepare('
        SELECT m.movie_name, g.genre_name
        FROM user_bookmark b
        JOIN movie m ON b.movie_id = m.movie_id
        JOIN movie_genre mg ON m.movie_id = mg.movie_id
        JOIN genre g ON mg.genre_id = g.genre_id
        WHERE b.user_id = ?');
    $sql->bind_param('i', $userId);
    $sql->execute();
    $result = $sql->get_result();
    $userData['bookmarks'] = $result->fetch_all(MYSQLI_ASSOC);

    $sql = $connection->prepare('
         SELECT m.movie_name, umm.user_clicks, umm.user_time
        FROM user_movie_metrics umm
        JOIN movie m ON umm.movie_id = m.movie_id
        WHERE umm.user_id = ?');
    $sql->bind_param('i', $userId);
    $sql->execute();
    $result = $sql->get_result();
    $userData['metrics'] = $result->fetch_all(MYSQLI_ASSOC);

    $sql = $connection->prepare("
    SELECT 
        m.movie_id,
        m.movie_name,
        m.movie_description,
        m.release_date,
        m.movie_image,
        m.movie_producer,
        g.genre_name,
        c.cast_name
    FROM 
        movie m 
    LEFT JOIN 
        movie_genre mg ON m.movie_id = mg.movie_id 
    LEFT JOIN 
        genre g ON mg.genre_id = g.genre_id 
    LEFT JOIN 
        `cast` c ON m.movie_id = c.movie_id
");
$sql->execute();
$result = $sql->get_result();

$movies_data = [];

while ($row = $result->fetch_assoc()) {
    $movieId = $row['movie_id'];

    if (!isset($movies_data[$movieId])) {
        $movies_data[$movieId] = [
            "movie_name" => $row["movie_name"],
            "release_date" => $row["release_date"],
            "movie_image" => $row["movie_image"],
            "movie_producer" => $row["movie_producer"],
            "movie_description" => $row["movie_description"],
            "genres" => [],
            "cast" => []
        ];
    }

    if ($row["genre_name"] && !in_array($row["genre_name"], $movies_data[$movieId]["genres"])) {
        $movies_data[$movieId]["genres"][] = $row["genre_name"];
    }

    if ($row["cast_name"] && !in_array($row["cast_name"], $movies_data[$movieId]["cast"])) {
        $movies_data[$movieId]["cast"][] = $row["cast_name"];
    }
}

$response = [
    "userData" => $userData,
    "movies_data" => array_values($movies_data)
];

echo json_encode($response);
$connection->close();
}