<?php

include("connection.php");

if (!isset($_GET["movie_id"])){
    echo json_encode(["success" => false, "message" => "Movie id is needed."]);
    exit();
}
$movie_id=$_GET['movie_id'];

$sql = $connection->prepare("Select movie_name,release_date,movie_image,movie_producer,g.genre_name,c.actor_name
                            from movie m join movie_genre mg on m.movie_id=mg.movie_id join genre g on mg.genre_id=g.genre_id join
                            cast c on m.movie_id=c.movie_id where m.movie_id=?");
$sql->bind_param("i",$movie_id);

$sql->execute();

$result = $sql->get_result();
$movie_data = [];
include("connection.php");

if (!isset($_GET["movie_id"])) {
    echo json_encode(["success" => false, "message" => "Movie id is needed."]);
    exit();
}

$movie_id = $_GET['movie_id'];

$sql = $connection->prepare("SELECT 
                                m.movie_name,
                                m.movie_description,
                                m.release_date,
                                m.movie_image,
                                m.movie_producer,
                                g.genre_name,
                                -- r.rating
                                c.actor_name
                             FROM 
                                movie m 
                             JOIN 
                                movie_genre mg ON m.movie_id = mg.movie_id 
                             JOIN 
                                genre g ON mg.genre_id = g.genre_id 
                             JOIN 
                                cast c ON m.movie_id = c.movie_id 
                            --  JOIN
                            --     movie_metrics r ON r.movie_id = m.movie_id
                             WHERE 
                                m.movie_id = ?");

// Bind the movie_id parameter
$sql->bind_param("i", $movie_id);

// Execute the query
$sql->execute();

// Fetch the results
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
            "movie_description"=>$row["movie_description"],
            // "rating"=> $row["rating"],
        ];
    }
    
    if (!in_array($row["genre_name"], $genres)) {
        $genres[] = $row["genre_name"];
    }
    
    if (!in_array($row["actor_name"], $cast)) {
        $cast[] = $row["actor_name"];
    }
}

$movie_data["genres"] = $genres;
$movie_data["cast"] = implode(", ", $cast);

$sql->close();
$connection->close();

// Output results as JSON
echo json_encode(["success" => true, "data" => $movie_data]);