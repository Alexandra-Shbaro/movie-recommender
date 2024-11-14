document.addEventListener("DOMContentLoaded", async function () {


    if (checkIfAdmin()) {
        window.location.href = "/movie-recommender/frontend/pages/admin.html"
    }

    const backToTopBtn = document.getElementById('back-to-top-btn');


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


    // Show the button only when scrolled more than the screen height
    window.addEventListener("scroll", () => {
        if (window.scrollY > window.innerHeight) {
            backToTopBtn.style.display = "flex"; // Show the button
        } else {
            backToTopBtn.style.display = "none"; // Hide the button
        }
    });
    backToTopBtn.addEventListener("click", () => {
        window.scrollTo({
            top: 0,        // Scroll to the top of the page
            behavior: "smooth"  // Smooth scroll
        });
    });

    document.querySelector(".search-button").addEventListener("click", function () {
        const keyword = document.getElementById('search').value ?? ""
        window.location.href = "/movie-recommender/frontend/pages/movieCategories.html?filter=keyword&keyword=" + keyword
    })

    let userId = localStorage.getItem("userid");

    recommendedContainer = document.getElementById("recommended");

    let messages = [
        {
            role: "system",
            content: `
            You are a movie recommendation assistant that returns JSON objects. Provide movie suggestions in JSON based on the user's preferences, ratings, and viewing history.Your answers should be a JSON object.
    
            Keep these guidelines in mind:
            - Give recommendations based on the user’s ratings of genres or movies: higher ratings mean they enjoy those categories, while lower ratings indicate they dislike them (1 star is the lowest, and 5 stars is the highest).
            - If the user has bookmarked a movie, assume they liked it.
            - Avoid recommending movies the user has already watched, rated, or bookmarked.
            - Only provide your answers as JSON objects.
            - Only provide the name,release date, image, and id of the movie.
            - be creative and give some random suggestions.
            `
        }
    ];

    async function sendRecommendation() {
        try {
            const userDataResponse = await fetch(`http://localhost/movie-recommender/backend/api/chatbotContext.php?user_id=${userId}`);
            const data = await userDataResponse.json();
            console.log("User data:", data);

            messages.push({
                role: "system",
                content: `These are the movies in our database: ${JSON.stringify(data.movies_data)}`
            });
            messages.push({
                role: "system",
                content: `User data:\nRatings: ${JSON.stringify(data.userData.ratings)}\nBookmarks: ${JSON.stringify(data.userData.bookmarks)}\nMetrics: ${JSON.stringify(data.userData.metrics)}`
            });

            messages.push({
                role: "system",
                content: "Please provide the movie recommendations strictly as a JSON object, with the format { recommendations: [...] }."
            });

            messages.push({
                role: "user",
                content: `give me 6 random movie recommendations as a JSON object`
            });

            const response = await fetch("http://localhost/movie-recommender/backend/api/chatbot.php?fast=1", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ messages }),
                mode: 'cors'
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }

            const result = await response.json();
            console.log("API response:", result);  // Check the structure of the response

            const assistantMessage = result.choices[0].message.content;
            console.log("Assistant message:", assistantMessage);

            let recommendedMovies;
            try {
                const parsedResponse = JSON.parse(assistantMessage);

                // Check if the response contains either `recommendations` or `movie_recommendations`
                recommendedMovies = parsedResponse.recommendations || parsedResponse.movie_recommendations;

            } catch (parseError) {
                console.error("JSON parsing error:", parseError);
                return;
            }

            if (!Array.isArray(recommendedMovies)) {
                console.error("Expected an array of recommendations, received:", recommendedMovies);
                return;
            }

            recommendedContainer.innerHTML = "";

            recommendedMovies.forEach(movie => {
                const movieLink = document.createElement("a");
                movieLink.href = `/movie-recommender/frontend/pages/movie-details.html?movie_id=${movie.movie_id}`;

                const movieItem = document.createElement("figure");
                movieItem.classList.add("movie-item");

                const imageWrapper = document.createElement("div");
                imageWrapper.classList.add("image-wrapper");

                const movieImg = document.createElement("img");
                movieImg.src = movie.movie_image || "../assets/images/default-movie.jpg";
                movieImg.alt = movie.movie_name;

                const movieSlide = document.createElement("div");
                movieSlide.classList.add("movie-slide");

                const releaseWrapper = document.createElement("div");
                releaseWrapper.classList.add("slide-sub-wrapper");
                const releaseTitle = document.createElement("h4");
                releaseTitle.textContent = "Release Date";
                const releaseDate = document.createElement("h5");
                releaseDate.textContent = movie.release_date;
                releaseWrapper.appendChild(releaseTitle);
                releaseWrapper.appendChild(releaseDate);

                movieSlide.appendChild(releaseWrapper);

                imageWrapper.appendChild(movieImg);
                imageWrapper.appendChild(movieSlide);

                const movieCaption = document.createElement("figcaption");
                movieCaption.classList.add("movie-title");
                movieCaption.textContent = movie.movie_name;

                movieItem.appendChild(imageWrapper);
                movieItem.appendChild(movieCaption);

                movieLink.appendChild(movieItem);

                recommendedContainer.appendChild(movieLink);
            });



            messages = [];
        } catch (error) {
            console.error("Error:", error);
        }
    }

    sendRecommendation();

    // Open and close chatbot panel
    const chatbotBtn = document.getElementById("chatbot-btn");
    const chatbotPanel = document.getElementById("chatbot-panel");
    const closeBtn = document.getElementById("close-btn");
    const chatWindow = document.getElementById("chat-window");
    const userInput = document.getElementById("user-input");
    const submitButton = document.getElementById("submit-btn");

    // Show and hide chatbot panel
    chatbotBtn.addEventListener("click", () => {
        chatbotPanel.style.right = "0";
    });

    closeBtn.addEventListener("click", () => {
        chatbotPanel.style.right = "-35%";
    });



    userId = localStorage.getItem("userid");
    messages = [
        {
            role: "system",
            content: `
            You are a friendly and knowledgeable movie recommendation assistant. 
            Your primary goal is to help users discover movies they'll enjoy based on their preferences. 
    
            Keep these guidelines in mind:
            - Give recommendations based on the user's ratings of genres or movies: higher ratings mean they enjoy those categories, while lower ratings indicate they dislike them (1 star is the lowest, and 5 stars is the highest).
            - If the user has bookmarked a movie, assume they liked it.
            - Avoid recommending movies the user has already watched, rated, or bookmarked unless they specifically ask to see them again.
            - If the user requests it, provide your answers as a JSON object. Otherwise, respond conversationally.
    
            Remember to ask questions to better understand the user's taste and preferences, and continue conversations naturally. Be proactive in guiding the user towards movies they might enjoy!
            `
        }
    ];


    // Flag to indicate that the profile data has been sent
    let profileSent = false;

    async function sendMessage() {
        const inputText = userInput.value.trim();
        if (inputText === "") return;

        // Display the user's message
        displayMessage("user", inputText);
        userInput.value = "";

        // Add user message to conversation
        messages.push({ role: "user", content: inputText });

        try {
            // Check if profile data has been sent; if not, fetch and send it
            if (!profileSent) {
                const userDataResponse = await fetch(`http://localhost/movie-recommender/backend/api/chatbotContext.php?user_id=${userId}`);
                const data = await userDataResponse.json();

                // Send initial movie database and user profile only once
                let userContextMessage = {
                    role: "system",
                    content: `Here is the initial context:\nMovies: ${JSON.stringify(data.movies_data)}\nUser Ratings: ${JSON.stringify(data.userData.ratings)}\nUser Bookmarks: ${JSON.stringify(data.userData.bookmarks)}`
                };
                messages.push(userContextMessage);

                // Set the profileSent flag to true after sending
                profileSent = true;
            }

            // Call the PHP backend for OpenAI response
            const response = await fetch("http://localhost/movie-recommender/backend/api/chatbot.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ messages }),
                mode: 'cors'
            });

            // Handle the response and display it
            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }

            const result = await response.json();
            const assistantMessage = result.choices[0].message.content;

            // Display the assistant's response and add to messages array
            displayMessage("assistant", assistantMessage);
            messages.push({ role: "assistant", content: assistantMessage });

        } catch (error) {
            console.error("Error:", error);
            displayMessage("assistant", "An error occurred. Please try again.");
        }
    }




    function displayMessage(role, text) {
        const messageElement = document.createElement("div");
        messageElement.classList.add("message", role);

        const messageBubble = document.createElement("div");
        messageBubble.classList.add("message-bubble");
        messageBubble.textContent = text;

        messageElement.appendChild(messageBubble);
        chatWindow.appendChild(messageElement);

        chatWindow.scrollTop = chatWindow.scrollHeight;
    }

    userInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter" && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        }
    });

    submitButton.addEventListener("click", sendMessage);

})

