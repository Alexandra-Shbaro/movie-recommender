document.addEventListener('DOMContentLoaded', async () => {

    if (checkIfAdmin()) {
        window.location.href = "/movie-recommender/frontend/pages/admin.html"
    }

    const urlParams = new URLSearchParams(window.location.search);
    const filter = urlParams.get('filter') || 'all';
    const keyword = urlParams.get('keyword') || '';

    const title = document.querySelector(".category h2");
    const container = document.querySelector(".category-movies");

    // Set title based on the filter
    switch (filter) {
        case 'release_date':
            title.textContent = 'Latest Movies';
            break;
        case 'top_rated':
            title.textContent = 'Top Rated Movies';
            break;
        case 'most_watched':
            title.textContent = 'Most Watched Movies';
            break;
        case 'keyword':
            title.textContent = `Search Results for "${keyword}"`;
            break;
        default:
            title.textContent = 'All Movies';
            break;
    }

    // Fetch movies based on filter and keyword
    const movies = await fetchMovies(filter, keyword);

    // Check if there are results, and populate or display 'No results found'
    if (movies.length > 0) {
        let content = "";
        movies.forEach(movie => {
            content += createMovieCard(movie);
        });
        container.innerHTML = content;
    } else {
        container.innerHTML = "<p class='no-movies'>No results found</p>";
    }

    document.querySelector(".search-button").addEventListener("click", function () {
        const keyword = document.getElementById('search').value ?? ""
        window.location.href = "/movie-recommender/frontend/pages/movieCategories.html?filter=keyword&keyword=" + keyword
    })

});
