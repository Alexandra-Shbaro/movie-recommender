<?php
include("connection.php");

// Check if `movie_id` is provided
if (!isset($_GET["movie_id"])) {
    echo json_encode(["success" => false, "message" => "Movie id is needed."]);
    exit();
}

$movie_id = $_GET['movie_id'];

// Prepare the main query to fetch movie details
$sql = $connection->prepare("SELECT 
                                m.movie_name,
                                m.movie_description,
                                m.release_date,
                                m.movie_image,
                                m.movie_producer,
                                g.genre_name,
                                r.final_count,
                                c.cast_name
                             FROM 
                                movie m 
                             JOIN 
                                movie_genre mg ON m.movie_id = mg.movie_id 
                             JOIN 
                                genre g ON mg.genre_id = g.genre_id 
                             JOIN 
                                `cast` c ON m.movie_id = c.movie_id 
                             JOIN
                                movie_metrics r ON r.movie_id = m.movie_id
                             WHERE 
                                m.movie_id = ?");

$sql->bind_param("i", $movie_id);
$sql->execute();
$result = $sql->get_result();

$movie_data = [];
$genres = [];
$cast = [];

while ($row = $result->fetch_assoc()) {
    if (empty($movie_data)) {
        $movie_data = [
            "movie_name" => $row["movie_name"],
            "release_date" => $row["release_date"],
            "movie_image" => $row["movie_image"],
            "movie_producer" => $row["movie_producer"],
            "movie_description" => $row["movie_description"],
            "rating" => $row["final_count"],
        ];
    }
    
    if (!in_array($row["genre_name"], $genres)) {
        $genres[] = $row["genre_name"];
    }
    
    if (!in_array($row["cast_name"], $cast)) {
        $cast[] = $row["cast_name"];
    }
}

$movie_data["genres"] = $genres;
$movie_data["cast"] = implode(", ", $cast);

$sql->close();

// Increment visit_count in `movie_metrics`
$update_sql = $connection->prepare("UPDATE movie_metrics SET visit_count = visit_count + 1 WHERE movie_id = ?");
$update_sql->bind_param("i", $movie_id);
$update_sql->execute();
$update_sql->close();

$connection->close();

echo json_encode(["success" => true, "data" => $movie_data]);
