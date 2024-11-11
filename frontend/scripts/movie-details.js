localStorage.setItem("movie_id", 6)
const movie_id = localStorage.getItem("movie_id");

const loadDetails = () => {
    const movierating = document.getElementById("movie-rating");
    const movieimage = document.getElementById("movie-img");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const producer = document.getElementById("producer");
    const cast = document.getElementById("cast");
    const releaseDate = document.getElementById("release-date");

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
                movierating.innerHTML = `${data.data.rating} / 5<img class="star" src="../assets/Icons/activestar.svg"> `;
            } else {
                console.log("Error:", data.message);
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};



loadDetails();
