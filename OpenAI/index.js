const chatWindow = document.getElementById("chat-window");
const userInput = document.getElementById("user-input");

// Messages array to track conversation
const messages = [
    { role: "system", content: "You are a friendly and helpful assistant who remembers user preferences." }
];

// Function to send a message to the PHP backend and receive a response
async function sendMessage() {
    const inputText = userInput.value.trim();
    if (inputText === "") return;

    // Add user message to chat display and clear input
    displayMessage("user", inputText);
    userInput.value = "";

    // Add user message to messages array for the API
    messages.push({ role: "user", content: inputText });

    // Call the PHP proxy for OpenAI response
    try {
    const response = await fetch("http://localhost/movie-recommender/OpenAI/index.php", {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({ messages }),
    mode: 'cors'
});

        // Check if the response was successful
        if (!response.ok) {
            throw new Error(`Error: ${response.status} ${response.statusText}`);
        }

        const result = await response.json();

        // Extract assistant's response from the result
        const assistantMessage = result.choices[0].message.content;

        // Display assistant's response
        displayMessage("assistant", assistantMessage);

        // Add assistant response to messages array for ongoing context
        messages.push({ role: "assistant", content: assistantMessage });

    } catch (error) {
        console.error("Error:", error);
        displayMessage("assistant", "An error occurred. Please try again.");
    }
}

// Function to display a message in the chat window
function displayMessage(role, text) {
    const messageElement = document.createElement("div");
    messageElement.classList.add("message", role);

    const messageBubble = document.createElement("div");
    messageBubble.classList.add("message-bubble");
    messageBubble.textContent = text;

    messageElement.appendChild(messageBubble);
    chatWindow.appendChild(messageElement);

    // Scroll to the latest message
    chatWindow.scrollTop = chatWindow.scrollHeight;
}

// Allow 'Enter' key to send messages
userInput.addEventListener("keypress", function(event) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        sendMessage();
    }
});
