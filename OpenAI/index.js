const chatWindow = document.getElementById("chat-window");
const userInput = document.getElementById("user-input");
const submitButton = document.getElementById("submit-btn");
userId = localStorage.getItem("userid");


const messages = [
    { role: "system", content: "You are a movie recommendation assistant. Provide movie suggestions based the user preferences. Higher rating means the user likes these categories, and lower rating means the user hates these categories.The lowest rating is 1 star and the highest rating is 5 stars, and he bookmarks the movies he likes. Don't give me the images, and don't give movies the user has already watched" }
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
