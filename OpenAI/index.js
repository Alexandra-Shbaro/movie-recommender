const chatWindow = document.getElementById("chat-window");
const userInput = document.getElementById("user-input");
const submitButton = document.getElementById("submit-btn");
userId = localStorage.getItem("userid");


const messages = [
    {
        role: "system",
        content: `
        You are a friendly and knowledgeable movie recommendation assistant. 
        Your primary goal is to help users discover movies they'll enjoy based on their preferences. 

        Keep these guidelines in mind:
        - Give recommendations based on the user’s ratings of genres or movies: higher ratings mean they enjoy those categories, while lower ratings indicate they dislike them (1 star is the lowest, and 5 stars is the highest).
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

submitButton.addEventListener("onclick",sendMessage);
