localStorage.setItem("movie_id", 6)
localStorage.setItem("user_id",5)
const movie_id = localStorage.getItem("movie_id");
const user_id = localStorage.getItem("user_id");
const stars = document.querySelectorAll('#user-rating .star');
const bookmarkImage=document.getElementById("bookmark-img")
let bookmarked=0;

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

const loaduserDetails = ()=>{
    fetch(`/movie-recommender/backend/api/loaduserDetails.php?movie_id=${movie_id}&user_id=${user_id}`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log("movie info loaded successfuly");
            rating = data.data.rating;
            bookmarked=data.data.bookmark;
            console.log(data.data.bookmark)
            if(bookmarked===1){
                bookmarkImage.src="../assets/Icons/activebookmark.png"
            }else{
                bookmarkImage.src="../assets/Icons/bookmark.png"
            }
            stars.forEach((s, i) => {
                if (i < rating) {
                    s.src = "../assets/Icons/activestar.svg";
                } else {
                    s.src = "../assets/Icons/rating.png";
                }
            });
        }else{
            console.log("what")
        }
    });
}

const bookmark=()=>{
    fetch(`/movie-recommender/backend/api/bookmark.php?movie_id=${movie_id}&user_id=${user_id}&bookmarked=${bookmarked}`)
    .then(response=>response.json())
    .then(data=>{
        if(data.success){
            if(bookmarked===0){
                console.log("Bookmark created");
                bookmarkImage.src="../assets/Icons/activebookmark.png"
                bookmarked=1;
            }else{
                console.log("bookmark deleted");
                bookmarkImage.src="../assets/Icons/bookmark.png"
                bookmarked=0;
            }
        }
    }).catch(error =>{
        console.error("Fetch error:", error);
    })
}

const rate = (event) => {
    const index = [...stars].indexOf(event.target);
    const rating = index + 1;
    fetch(`http://localhost/movie-recommender/backend/api/rate.php?movie_id=${movie_id}&user_id=${user_id}&rating=${rating}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("Rating updated");
                stars.forEach((star, i) => {
                    if (i < rating) {
                        star.src = "../assets/Icons/activestar.svg";
                    } else {
                        star.src = "../assets/Icons/rating.png";
                    }
                });
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
        });
};


document.getElementById("bookmark").addEventListener('click',bookmark);
stars.forEach((star) => {
    star.addEventListener('click', rate);
});

loadDetails();
loaduserDetails();