<?php

include "connection.php";

$filter = isset($_GET['filter']) ? $_GET['filter'] : 'all';
$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';  // Get the keyword if available
$user_id = isset($_GET['user_id']) ? $_GET['user_id'] : '';  // Get the keyword if available

// Function to fetch all movies
function getAllMovies($connection)
{
    $sql = "SELECT * FROM movie";
    return $connection->query($sql);
}

// Function to fetch movies by release date
function getMoviesByReleaseDate($connection)
{
    $sql = "SELECT * FROM movie ORDER BY release_date DESC LIMIT 10";
    return $connection->query($sql);
}

// Function to fetch top-rated movies
function getTopRatedMovies($connection)
{
    $sql = "SELECT m.movie_id, m.movie_name, m.release_date, m.movie_description, m.movie_image, m.movie_producer, 
               mm.rating_total / mm.rating_count AS avg_rating 
          FROM movie m 
          JOIN movie_metrics mm ON m.movie_id = mm.movie_id
          ORDER BY avg_rating DESC
          LIMIT 15";
    return $connection->query($sql);
}

// Function to get most-watched movies
function getMostWatchedMovies($connection)
{
    $sql = "SELECT m.movie_id, m.movie_name, m.release_date, m.movie_description, m.movie_image, m.movie_producer, mm.visit_time
          FROM movie m 
          JOIN movie_metrics mm ON m.movie_id = mm.movie_id
          ORDER BY mm.visit_time DESC
          LIMIT 15";
    return $connection->query($sql);
}

// Function to fetch top-rated movies with optional keyword filtering (case-insensitive) using prepared statements
function getFilteredMovies($connection, $keyword = '')
{
    $sql = "SELECT DISTINCT(m.movie_id), m.movie_name, m.release_date, m.movie_description, m.movie_image, m.movie_producer, 
               mm.rating_total / mm.rating_count AS avg_rating 
            FROM movie m 
            JOIN movie_metrics mm ON m.movie_id = mm.movie_id
            JOIN cast c ON c.movie_id = m.movie_id";

    if (!empty($keyword)) {
        $sql .= " WHERE LOWER(m.movie_name) LIKE ? OR LOWER(m.movie_producer) LIKE ? OR LOWER(c.cast_name) LIKE ?";
    }

    $stmt = $connection->prepare($sql);

    if (!empty($keyword)) {
        $keyword = "%" . strtolower($keyword) . "%";
        $stmt->bind_param("sss", $keyword, $keyword, $keyword);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    return $result;
}

// Handle filters
switch ($filter) {
    case 'release_date':
        $movies = getMoviesByReleaseDate($connection);
        break;
    case 'top_rated':
        $movies = getTopRatedMovies($connection);
        break;
    case 'most_watched':
        $movies = getMostWatchedMovies($connection);
        break;
    case 'keyword':
        if ($keyword) {
            $movies = getFilteredMovies($connection, $keyword);
        } else {
            $movies = getAllMovies($connection);
        }
        break;
    case 'bookmarked':
        if ($user_id) {
            $movies = getFilteredMovies($connection, $keyword); // change this
        } else {
            $movies = [];
        }
        break;
    default:
        $movies = getAllMovies($connection);
}

// Prepare response
$response = [];
if ($movies->num_rows > 0) {
    $moviesArray = [];
    while ($row = $movies->fetch_assoc()) {
        $moviesArray[] = $row;
    }
    $response['data'] = $moviesArray;
} else {
    $response['data'] = [];
}

// Return JSON response
echo json_encode($response);

$connection->close();
