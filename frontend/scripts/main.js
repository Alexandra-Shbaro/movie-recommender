document.addEventListener("DOMContentLoaded", async function () {

    //get newest releases
    const newestReleases = document.getElementById("newest-releases");
    const newestMovies = await fetchMovies('release_date');

    let newestContent = "";
    newestMovies.map(movie => {
        newestContent += createMovieCard(movie)
    });

    newestReleases.innerHTML = newestContent;

    //get top rated movies 

    const topRated = document.getElementById("top-rated");
    const topMovies = await fetchMovies('top_rated');

    let topContent = "";
    topMovies.map(movie => {
        topContent += createMovieCard(movie)
    });

    topRated.innerHTML = topContent;

    // get most watched movies 

    const mostWatched = document.getElementById("most-watched");
    const mostMovies = await fetchMovies('most_watched');

    let mostContent = "";
    mostMovies.map(movie => {
        mostContent += createMovieCard(movie)
    });

    mostWatched.innerHTML = mostContent;

    document.querySelectorAll('.loadMore').forEach(button => {
        button.addEventListener('click', () => {
            const rowContainer = button.closest('.row-container');
            const movieRow = rowContainer.querySelector('.movie-row'); // Target the container you want to duplicate
            const scrollAmount = 300; // Adjust as needed

            // Check if the scroll is near the end of the container
            if (rowContainer.scrollLeft + rowContainer.clientWidth >= rowContainer.scrollWidth - scrollAmount) {
                // Clone the content of movieRow
                const clonedContent = Array.from(movieRow.children).map(child => child.cloneNode(true));

                // Append each cloned element back to the movieRow container
                clonedContent.forEach(clone => movieRow.appendChild(clone));

                // Adjust scroll position to maintain smooth infinite scroll effect
                rowContainer.scrollLeft -= rowContainer.clientWidth;
            }

            // Scroll by the specified amount
            rowContainer.scrollBy({ left: scrollAmount, behavior: 'smooth' });
        });
    });

    document.querySelector(".search-button").addEventListener("click", function () {
        const keyword = document.getElementById('search').value ?? ""
        window.location.href = "/movie-recommender/frontend/pages/movieCategories.html?filter=keyword&keyword=" + keyword
    })

    userId = localStorage.getItem("userid");

    recommendedContainer =document.getElementById("recommended");

    const messages = [
        {
            role: "system",
            content: `
            You are a movie recommendation assistant. Provide movie suggestions based on the user's preferences, ratings, and viewing history.Your answers should be a JSON object.
    
            Keep these guidelines in mind:
            - Give recommendations based on the user’s ratings of genres or movies: higher ratings mean they enjoy those categories, while lower ratings indicate they dislike them (1 star is the lowest, and 5 stars is the highest).
            - If the user has bookmarked a movie, assume they liked it.
            - Avoid recommending movies the user has already watched, rated, or bookmarked.
            - Only provide your answers as JSON objects.
            `
        }
    ];
    
    async function sendMessage() {
        const inputText = userInput.value.trim();
        if (inputText === "") return;
    
        displayMessage("user", inputText);
        userInput.value = "";
    
        messages.push({ role: "user", content: inputText });
    
        try {
            const userDataResponse = await fetch(`http://localhost/movie-recommender/backend/api/chatbotContext.php?user_id=${userId}`);
            const data = await userDataResponse.json();
            let userContextMessage = {
                role: "system",
                content: `These are the movies that are in our database :\nMovies: ${JSON.stringify(data.movies_data)}}`
            };
            messages.push(userContextMessage);
            userContextMessage = {
                role: "system",
                content: `Here is additional context about the user:\nRatings: ${JSON.stringify(data.userData.ratings)}\nBookmarks: ${JSON.stringify(data.userData.bookmarks)}\nMetrics: ${JSON.stringify(data.userData.metrics)}`
            };
    
            messages.push(userContextMessage);
    
            userContextMessage = {
                role: "user",
                content: `give me 6 movie recommendations as a JSON object`
            };
    
            const response = await fetch("http://localhost/movie-recommender/backend/api/chatbot.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ messages }),
                mode: 'cors'
            });
    
            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
    
            const result = await response.json();
    
            const assistantMessage = result.choices[0].message.content;
    
            displayMessage("assistant", assistantMessage);
    
    
            messages.push({ role: "assistant", content: assistantMessage });
    
        } catch (error) {
            console.error("Error:", error);
            displayMessage("assistant", "An error occurred. Please try again.");
        }
    }



})

