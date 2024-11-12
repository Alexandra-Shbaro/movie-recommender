localStorage.setItem("movieid", 8);
const movie_id = localStorage.getItem("movieid");
const user_id = localStorage.getItem("userid");

const stars = document.querySelectorAll('#user-rating .star');
const bookmarkImage = document.getElementById("bookmark-img");
let bookmarked = 0;

const loadDetails = () => {
    const movierating = document.getElementById("movie-rating");
    const movieimage = document.getElementById("movie-img");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const producer = document.getElementById("producer");
    const cast = document.getElementById("cast");
    const releaseDate = document.getElementById("release-date");
    const genreContainer = document.querySelector(".genre-container");
    fetch(`/movie-recommender/backend/api/loadDetails.php?movie_id=${movie_id}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("Movie Loaded successfully");
                movieimage.src = data.data.movie_image;
                title.innerHTML = data.data.movie_name;
                description.innerHTML = data.data.movie_description;
                producer.innerHTML = `Producer: ${data.data.movie_producer}`;
                cast.innerHTML = `Cast: ${data.data.cast}`;
                releaseDate.innerHTML = `Release Date: ${data.data.release_date}`;
                movierating.innerHTML = `${data.data.rating} / 5 <img class="star" src="../assets/Icons/activestar.svg">`;
                genreContainer.innerHTML = '';
                data.data.genres.forEach(genre => {
                    let genreDiv = document.createElement("div");
                    genreDiv.className = "genre";
                    genreDiv.innerText = genre;
                    genreContainer.appendChild(genreDiv);
                });
            } else {
                console.log("Error:", data.message);
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};

const loaduserDetails = () => {
    fetch(`/movie-recommender/backend/api/loaduserDetails.php?movie_id=${movie_id}&user_id=${user_id}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("Movie info loaded successfully");
                const rating = data.data.rating;
                bookmarked = data.data.bookmark;
                
                // Update bookmark icon based on bookmark status
                bookmarkImage.src = bookmarked === 1 ? "../assets/Icons/activebookmark.png" : "../assets/Icons/bookmark.png";

                // Update star icons based on rating
                stars.forEach((s, i) => {
                    s.src = i < rating ? "../assets/Icons/activestar.svg" : "../assets/Icons/rating.png";
                });
            } else {
                console.log("Error in loading user details");
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};

const bookmark = () => {
    fetch(`/movie-recommender/backend/api/bookmark.php?movie_id=${movie_id}&user_id=${user_id}&bookmarked=${bookmarked}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                bookmarked = 1 - bookmarked; // Toggle bookmark status
                bookmarkImage.src = bookmarked ? "../assets/Icons/activebookmark.png" : "../assets/Icons/bookmark.png";
                console.log(bookmarked ? "Bookmark created" : "Bookmark deleted");
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};

const rate = (event) => {
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

// Event listeners
document.getElementById("bookmark").addEventListener('click', bookmark);
stars.forEach((star) => {
    star.addEventListener('click', rate);
});

// Load data on page load
loadDetails();
loaduserDetails();
