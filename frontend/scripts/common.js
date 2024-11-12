
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
    const { movie_image, movie_name, movie_id } = movie

    return `
    <a href="/movie-recommender/frontend/pages/movie-details.html?movie_id=${movie_id}">
     <figure class="movie-item">
            <img src="${movie_image}" alt="${movie_name}">
            <figcaption class="movie-title">${movie_name}</figcaption>
      </figure>
    </a>
    `      
}

async function fetchMovies(filter = 'all') {
    try {
        const response = await fetch(`/movie-recommender/backend/api/getMovies.php?filter=${filter}`);
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