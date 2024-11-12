<?php 

include "connection.php";

$filter = isset($_GET['filter']) ? $_GET['filter'] : 'all';

//function to fetch all movies 
function getAllMovies($connection){
    $sql = "SELECT * from movie";
    $result = $connection->query($sql);
    return $result;
}

//function to fetch movies by release date 
function getMoviesByReleaseDate($connection){
    $sql = "SELECT * FROM movie ORDER BY release_date DESC";
    $result = $connection->query($sql);
    return $result;
}

//function to fetch top rated movies
function getTopRatedMovies($connection){
    $sql = "SELECT m.movie_id, m.movie_name, m.release_date, m.movie_description, m.movie_image, m.movie_producer, 
               mm.rating_total / mm.rating_count AS avg_rating 
          FROM movie m 
          JOIN movie_metrics mm ON m.movie_id = mm.movie_id
          ORDER BY avg_rating DESC
          LIMIT 15";
    $result = $connection->query($sql);
    return $result;
}

//function to get most watched movies 
function getMostWatchedMovies($connection){
    $sql = "SELECT m.movie_id, m.movie_name, m.release_date, m.movie_description, m.movie_image, m.movie_producer, mm.visit_time
          FROM movie m 
          JOIN movie_metrics mm ON m.movie_id = mm.movie_id
          ORDER BY mm.visit_time DESC
          LIMIT 15";
    $result = $connection->query($sql);
    return $result;
}

//handling filters
switch ($filter){
    case 'release_date':
        $movies = getMoviesByReleaseDate($connection);
        break;
    case 'top_rated':
        $movies = getTopRatedMovies($connection);
        break;
    case 'most_watched':
        $movies = getMostWatchedMovies($connection);
        break;
    default:
        $movies = getAllMovies($connection);
}

//check if any movies were found 
if ($movies->num_rows > 0) {
    $moviesArray = [];
    while ($row = $movies->fetch_assoc()) {
        $moviesArray[] = $row;
    }
    echo json_encode($moviesArray);
} else {
    echo json_encode(["message" => "No movies found for the filter: " . $filter]);
}

$connection->close();

?>
