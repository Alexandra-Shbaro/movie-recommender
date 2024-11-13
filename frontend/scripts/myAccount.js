document.addEventListener('DOMContentLoaded', async () => {


    // Check if the user is already logged in
    if (!checkUserLoggedIn()) {
        window.location.href = "index.html";
    }

    const user_id = getLoggedInId()

    // Fetch the username using the user_id (adjust the endpoint as needed)
    const userResponse = await fetch(`/movie-recommender/backend/api/getUserDetails.php?user_id=${user_id}`);
    const userData = await userResponse.json();

    const username = userData.data.username;

    // Set the welcome message with the username
    const title = document.querySelector(".account h2");
    title.textContent = `Welcome, ${username}`;

    // Fetch bookmarked movies for the user
    const movies = await fetchMovies("bookmarked", '', user_id)


    const container = document.querySelector(".account-movies");

    // Check if there are bookmarked movies and display them, or show a 'No results found' message
    if (movies.length > 0) {
        let content = "";
        movies.map(movie => {
            content += createMovieCard(movie);
        });
        container.innerHTML = content;
    } else {
        container.innerHTML = "<p class='no-movies'>No Bookmarks found</p>";
    }



});