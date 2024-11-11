localStorage.setItem("movie_id",1)
const movie_id = localStorage.getItem("movie_id");

const loadDetails=()=>{
    const movierating = document.getElementById("movie-rating");
    const movieimage= document.getElementById("movie-img");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const producer = document.getElementById("producer");
    const cast = document.getElementById("cast");
    fetch(`/movie-recommender/backend/loadDetails.php?movie_id=${movie_id}`)
    .then(Response=>Response.json())
    .then(data=>{
        if (data.success) {
            console.log("Movie Loaded successfully");
            console.log("Movie Data:", data.data);
        }else {
            console.log("Error:", data.message); 
        }
    }).catch(error => {
        console.error("Fetch error:", error);
    });
}
loadDetails();
