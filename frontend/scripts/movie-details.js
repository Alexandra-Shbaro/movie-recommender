if (checkIfAdmin()) {
    window.location.href = "/movie-recommender/frontend/pages/admin.html"
}

// Get user ID and movie ID from localStorage and query string
const user_id = localStorage.getItem("user_id");
const movie_id = new URLSearchParams(window.location.search).get('movie_id');
const stars = document.querySelectorAll('#user-rating .star');
const bookmarkImage = document.getElementById("bookmark-img");
let startTime = Date.now();
let bookmarked=0;
const loadDetails = async () => {
    const movierating = document.getElementById("movie-rating");
    const movieimage = document.getElementById("movie-img");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const producer = document.getElementById("producer");
    const cast = document.getElementById("cast");
    const releaseDate = document.getElementById("release-date");
    const genreContainer = document.querySelector(".genre-container");

    try {
        const response = await fetch(`/movie-recommender/backend/api/loadDetails.php?movie_id=${movie_id}`);
        const data = await response.json();

        if (data.success) {
            const { movie_image, movie_name, movie_description, movie_producer, cast: movieCast, release_date, rating, genres } = data.data;
            movieimage.src = movie_image;
            title.innerHTML = movie_name;
            description.innerHTML = movie_description;
            producer.innerHTML = `Producer: <p class='lighter'>${movie_producer}</p>`;
            cast.innerHTML = `Cast: <p class='lighter'>${movieCast}</p>`;
            releaseDate.innerHTML = `Release Date: <p class='lighter'>${release_date}</p>`;
            movierating.innerHTML = `${rating} / 5 <img class="star" src="../assets/icons/active_star.svg">`;

            genreContainer.innerHTML = '';
            genres.forEach(genre => {
                const genreDiv = document.createElement("div");
                genreDiv.className = "genre";
                genreDiv.innerText = genre;
                genreContainer.appendChild(genreDiv);
            });
        } else {
            console.log("Error:", data.message);
        }
    } catch (error) {
        console.error("Fetch error:", error);
    }
};

// Load user details (rating and bookmark status)
const loadUserDetails = async () => {
    if (user_id) {
        try {
            const response = await fetch(`/movie-recommender/backend/api/loaduserDetails.php?movie_id=${movie_id}&user_id=${user_id}`);
            const data = await response.json();
            if (data.success) {
                const { rating, bookmark } = data.data;
                bookmarked = bookmark;

                // Update bookmark icon based on bookmark status
                bookmarkImage.src = bookmarked ? "../assets/icons/active_bookmark.png" : "../assets/icons/bookmark.png";

                // Update star icons based on rating
                stars.forEach((s, i) => {
                    s.src = i < rating ? "../assets/icons/active_star.svg" : "../assets/icons/rating.png";
                });
            } else {
                console.log("Error in loading user details");
            }
        } catch (error) {
            console.error("Fetch error:", error);
        }
    } else {
        // Hide rating and bookmark if not logged in
        document.getElementById("user-rating").style.display = "none";
        document.getElementById("bookmark").style.display = "none";
    }
};

// Bookmark functionality
const bookmark = async () => {
    try {
        const response = await fetch(`/movie-recommender/backend/api/bookmark.php?movie_id=${movie_id}&user_id=${user_id}&bookmarked=${bookmarked}`);
        const data = await response.json();

        if (data.success) {
            bookmarked = 1 - bookmarked;
            bookmarkImage.src = bookmarked ? "../assets/icons/active_bookmark.png" : "../assets/icons/bookmark.png";
            console.log(bookmarked ? "Bookmark created" : "Bookmark deleted");
        }
    } catch (error) {
        console.error("Fetch error:", error);
    }
};

// Rate functionality
const rate = async (event) => {
    const index = [...stars].indexOf(event.target);
    const rating = index + 1;
    fetch(`/movie-recommender/backend/api/rate.php?movie_id=${movie_id}&user_id=${user_id}&rating=${rating}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("Rating updated");
                stars.forEach((star, i) => {
                    star.src = i < rating ? "../assets/Icons/activestar.svg" : "../assets/Icons/rating.png";
                });
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};

// Event listeners for bookmark and rating
document.getElementById("bookmark").addEventListener('click', bookmark);
stars.forEach(star => star.addEventListener('click', rate));



const updateTimeSpent = () => {
    const endTime = Date.now();
    const timeSpent = Math.floor((endTime - startTime) / 1000);

    if (user_id && movie_id) {
        fetch(`/movie-recommender/backend/api/updateTime.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                movie_id: movie_id,
                user_id: user_id,
                user_time: timeSpent
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("Time spent updated successfully");
            } else {
                console.log("Error updating time spent:", data.message);
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
    }
};

window.addEventListener('beforeunload', updateTimeSpent);



loadDetails();
loadUserDetails();
