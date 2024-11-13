document.addEventListener("DOMContentLoaded", function () {
    if (!checkIfAdmin()) {
        window.location.href = "/movie-recommender/frontend/pages/index.html"
    }

})