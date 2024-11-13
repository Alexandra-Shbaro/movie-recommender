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

    document.querySelectorAll('.loadMore').forEach(button => {
        button.addEventListener('click', () => {
            const rowContainer = button.closest('.row-container');
            const movieRow = rowContainer.querySelector('.movie-row'); // Target the container you want to duplicate
            const scrollAmount = 300; // Adjust as needed

            // Check if the scroll is near the end of the container
            if (rowContainer.scrollLeft + rowContainer.clientWidth >= rowContainer.scrollWidth - scrollAmount) {
                // Clone the content of movieRow
                const clonedContent = Array.from(movieRow.children).map(child => child.cloneNode(true));

                // Append each cloned element back to the movieRow container
                clonedContent.forEach(clone => movieRow.appendChild(clone));

                // Adjust scroll position to maintain smooth infinite scroll effect
                rowContainer.scrollLeft -= rowContainer.clientWidth;
            }

            // Scroll by the specified amount
            rowContainer.scrollBy({ left: scrollAmount, behavior: 'smooth' });
        });
    });

    document.querySelector(".search-button").addEventListener("click", function () {
        const keyword = document.getElementById('search').value ?? ""
        window.location.href = "/movie-recommender/frontend/pages/movieCategories.html?filter=keyword&keyword=" + keyword
    })




})

