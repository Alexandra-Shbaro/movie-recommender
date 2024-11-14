// Check if the user is already logged in
if (checkUserLoggedIn()) {
    window.location.href = "index.html";
}

// DOM elements
const loginbtn = document.getElementById("login-button");
const registerbtn = document.getElementById("register-button");
const email = document.getElementById("email-div");
const logintitle = document.getElementById("login-title");
const registertitle = document.getElementById("register-title");

let userswitch = 0;
email.classList.add("hidden");
registerbtn.classList.add("hidden");

// Toggle between Register and Login
const toggleUI = (isRegister) => {
    email.classList.toggle("hidden");
    registerbtn.classList.toggle("hidden");
    loginbtn.classList.toggle("hidden");
    gsap.to(".line", { duration: 0.5, x: isRegister ? 275 : 0 });
    userswitch = isRegister ? 1 : 0;
};

// Event listeners for switching between register and login forms
registertitle.addEventListener("click", () => toggleUI(true));
logintitle.addEventListener("click", () => toggleUI(false));


const switchtoRegister = () => {
    if (userswitch === 0) {
        email.classList.toggle("hidden");
        registerbtn.classList.toggle("hidden");
        loginbtn.classList.toggle("hidden")
        gsap.to(".line", { duration: 0.5, x: 275 })
        userswitch = 1;
    }
}

const switchtoLogin = () => {
    if (userswitch === 1) {
        email.classList.toggle("hidden");
        registerbtn.classList.toggle("hidden");
        loginbtn.classList.toggle("hidden")
        gsap.to(".line", { duration: 0.5, x: 0 })
        userswitch = 0;
    }
}

registertitle.addEventListener("click", switchtoRegister);
logintitle.addEventListener("click", switchtoLogin);


const errorMessage = document.getElementById("error-message");

const displayError = (message) => {
    errorMessage.textContent = message;
    errorMessage.classList.remove("hidden");
};

const clearError = () => {
    errorMessage.textContent = "";
    errorMessage.classList.add("hidden");
};

// Handle user registration
const registerUser = async () => {
    const username = document.getElementById("username").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    clearError();
    try {
        const response = await fetch(`/movie-recommender/backend/api/register.php`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username, email, password }),
        });

        const data = await response.json();

        if (data.success) {

            const { user_id } = data

            localStorage.setItem("user_id", user_id);
            window.location.href = "/movie-recommender/frontend/pages/index.html";
        } else {
            console.log("Error:", data.message);
            displayError(data.message || "An error occurred during registration.");
        }
    } catch (error) {
        console.error("Fetch error:", error);
        displayError("Unable to register at this time. Please try again later.");
    }
};

// Handle user login
const loginUser = async () => {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    clearError();
    try {
        const response = await fetch(`/movie-recommender/backend/api/login.php`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username, password }),
        });

        const data = await response.json();

        if (data.success) {

            const { user_id, isAdmin } = data
            localStorage.setItem("user_id", user_id);

            if (isAdmin) {
                localStorage.setItem("isAdmin", "true");
                window.location.href = "/movie-recommender/frontend/pages/admin.html";
            } else {
                window.location.href = "/movie-recommender/frontend/pages/index.html";
            }
        } else {
            console.log("Error:", data.message);
            displayError(data.message || "Invalid username or password.");
        }
    } catch (error) {
        console.error("Fetch error:", error);
        displayError("Unable to log in at this time. Please try again later.");
    }
};

// Event listeners for login and register buttons
loginbtn.addEventListener("click", loginUser);
registerbtn.addEventListener("click", registerUser);

