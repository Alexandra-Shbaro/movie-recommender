userId = localStorage.getItem("userid");


const messages = [
    {
        role: "system",
        content: `
        You are a movie recommendation assistant. Provide movie suggestions based on the user's preferences, ratings, and viewing history.Your answers should be a JSON object.

        Keep these guidelines in mind:
        - Give recommendations based on the user’s ratings of genres or movies: higher ratings mean they enjoy those categories, while lower ratings indicate they dislike them (1 star is the lowest, and 5 stars is the highest).
        - If the user has bookmarked a movie, assume they liked it.
        - Avoid recommending movies the user has already watched, rated, or bookmarked.
        - If the user requests it, provide your answers as a JSON object.
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
            content: `give me recommendations as a JSON object`
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