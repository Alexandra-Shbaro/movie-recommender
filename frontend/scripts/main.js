document.addEventListener("DOMContentLoaded", async function () {

    //get newest releases
    const newestReleases = document.getElementById("newest-releases");
    const newestMovies = await fetchMovies('release_date');

    let newestContent = "";
    newestMovies.map(movie => {
        newestContent += createMovieCard(movie)
    });

    newestReleases.innerHTML = newestContent;

    //get top rated movies 

    const topRated = document.getElementById("top-rated");
    const topMovies = await fetchMovies('top_rated');

    let topContent = "";
    topMovies.map(movie => {
        topContent += createMovieCard(movie)
    });

    topRated.innerHTML = topContent;

    // get most watched movies 

    const mostWatched = document.getElementById("most-watched");
    const mostMovies = await fetchMovies('most_watched');

    let mostContent = "";
    mostMovies.map(movie => {
        mostContent += createMovieCard(movie)
    });

    mostWatched.innerHTML = mostContent;

})

