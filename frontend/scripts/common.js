
const header = document.querySelector("header");
const logout_btn = document.querySelector(".logout-btn-header");

if (!checkUserLoggedIn()) {
    if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
        <div>
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="login-btn-header">Login</button>
          </a>
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="signup-btn-header">Signup</button>  
          </a>
        </div>
          <img class="burger-menu" src="../assets/icons/menu.png">   
        </div>
        `;
    }
} else {
    if (checkIfAdmin() && header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
           <button class="logout-btn-header">Logout</button>  
         </div>`;
    } else if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
          <div>
           <a href="/movie-recommender/frontend/pages/myAccount.html">
               <button class="myaccount-btn-header">My Account</button>  
           </a>
           <button class="logout-btn-header">Logout</button>
          </div>
           <img class="burger-menu" src="../assets/icons/menu.png">   
         </div>`;
    }
}



function checkUserLoggedIn() {
    const user_id = getLoggedInId();
    return !!user_id;
}


function checkIfAdmin() {
    const isAdmin = localStorage.getItem("isAdmin") == "true"
    return isAdmin
}

function getLoggedInId() {
    const user_id = localStorage.getItem("user_id");
    return user_id
}

function logoutUser() {
    localStorage.removeItem("user_id")
    localStorage.removeItem("isAdmin")
    window.location.replace("/movie-recommender/frontend/pages/index.html")
}

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

async function fetchMovies(filter = 'all', keyword = '', user_id = '') {
    try {
        // If the filter is 'keyword', add the keyword parameter to the URL
        let url = `/movie-recommender/backend/api/getMovies.php?filter=${filter}`;

        // If a keyword is provided and filter is 'keyword', add the keyword to the URL
        if (filter === 'keyword' && keyword) {
            url += `&keyword=${encodeURIComponent(keyword)}`;
        }
        // If a keyword is provided and filter is 'keyword', add the keyword to the URL
        if (filter === 'bookmarked' && user_id) {
            url += `&user_id=${encodeURIComponent(user_id)}`;
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

async function fetchAllUsers() {
    const url = '/movie-recommender/backend/api/getAllUsers.php'

    try {
        const response = await fetch(url, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();

        if (data.success) {
            return data.data;
        } else {
            throw new Error(data.message || "Failed to fetch users");
        }
    } catch (error) {
        console.error("Error fetching non-admin users:", error);
        return null;
    }
}

async function banUser(user_id) {
    const url = '/movie-recommender/backend/api/banUser.php';

    if (!user_id) {
        console.error("User ID is required.");
        return null;
    }

    try {
        const body = `user_id=${encodeURIComponent(user_id)}`; // Encode key and value

        const response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded", // URL-encoded content type
            },
            body, // Send the encoded string
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();

        if (data.success) {
            console.log(data.message); // Success message
            return data;
        } else {
            throw new Error(data.message || "Failed to ban the user.");
        }
    } catch (error) {
        console.error("Error banning user:", error.message);
        return null;
    }
}

async function unbanUser(user_id) {
    const url = '/movie-recommender/backend/api/unbanUser.php';

    if (!user_id) {
        console.error("User ID is required.");
        return null;
    }

    try {
        const body = `user_id=${encodeURIComponent(user_id)}`; // Encode key and value

        const response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded", // URL-encoded content type
            },
            body, // Send the encoded string
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();

        if (data.success) {
            console.log(data.message); // Success message
            return data;
        } else {
            throw new Error(data.message || "Failed to unban the user.");
        }
    } catch (error) {
        console.error("Error unbanning user:", error.message);
        return null;
    }
}

async function checkUserBanned(user_id) {
    const url = `/movie-recommender/backend/api/checkBanned.php?user_id=${encodeURIComponent(user_id)}`;

    if (!user_id) {
        console.error("User ID is required.");
        return false;
    }

    try {
        const response = await fetch(url, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const { success, isBanned } = await response.json();

        if (success) {
            return isBanned;
        } else {
            console.error("Failed to check user ban status.");
            return false;
        }
    } catch (error) {
        console.error("Error checking user ban status:", error.message);
        return false;
    }
}



window.addEventListener('scroll', () => {
    if (window.scrollY > 0) {
        header.style.backgroundColor = 'black';
    } else {
        header.style.backgroundColor = 'rgba(0, 0, 0, 0.60)';
    }
});

document.querySelector(".logout-btn-header")?.addEventListener('click', () => {
    logoutUser()
})

document.addEventListener("DOMContentLoaded", () => {

    const overlayMenu = document.getElementById("overlayMenu");


    // Open the overlay menu
    document.querySelector(".burger-menu")?.addEventListener("click", () => {
        overlayMenu?.classList.add("active");
    });

    // Close the overlay menu
    document.querySelector(".close-menu")?.addEventListener("click", () => {
        overlayMenu.classList.remove("active");
    });
});



