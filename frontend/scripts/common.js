
const header = document.querySelector("header");

if (!checkUserLoggedIn()) {

    if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="login-btn-header">Login</button>
          </a>
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="signup-btn-header">Signup</button>  
          </a> 
        </div>
        `;
    }

} else {
    if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
           <a href="/movie-recommender/frontend/pages/my-account.html">
               <button class="myaccount-btn-header">My Account</button>  
           </a> 
         </div>`;
    }
}


function checkUserLoggedIn() {
    const user_id = localStorage.getItem("user_id");
    return !!user_id;
};

function createMovieCard(movie) {
    const { movie_image, movie_name, movie_id, movie_producer, release_date, avg_rating } = movie

    return `
    <a href="/movie-recommender/frontend/pages/movie-details.html?movie_id=${movie_id}">
     <figure class="movie-item">
            <div class="image-wrapper">
            <img src="${movie_image}" alt="${movie_name}">
            <div class="movie-slide">
            <div class="slide-sub-wrapper">
              <h4>Producer</h4>
              <h5>${movie_producer}</h5>
            </div>
            <div class="slide-sub-wrapper">
              <h4>Release Date</h4>
              <h5>${release_date}</h5>
            </div>
            <div class="slide-sub-wrapper">
              <h4>Rating</h4>
              <h5>${!!avg_rating ? parseInt(avg_rating) + '<img class="star" src="../assets/icons/rating.png">' : "Not Rated"}</h5>
            </div>
            </div>
            </div>
            <figcaption class="movie-title">${movie_name}</figcaption>
      </figure>
    </a>
    `
}

async function fetchMovies(filter = 'all', keyword = '') {
    try {
        // If the filter is 'keyword', add the keyword parameter to the URL
        let url = `/movie-recommender/backend/api/getMovies.php?filter=${filter}`;

        // If a keyword is provided and filter is 'keyword', add the keyword to the URL
        if (filter === 'keyword' && keyword) {
            url += `&keyword=${encodeURIComponent(keyword)}`;
        }

        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`Error fetching movies: ${response.statusText}`);
        }

        const result = await response.json();
        return result.data || [];
    } catch (error) {
        console.error(error);
        return [];
    }
}


window.addEventListener('scroll', () => {
    if (window.scrollY > 0) {
        header.style.backgroundColor = 'black';
    } else {
        header.style.backgroundColor = 'rgba(0, 0, 0, 0.60)';
    }
});