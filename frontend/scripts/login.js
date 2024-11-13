if (checkUserLoggedIn()) { window.location.href = "index.html" }

let userswitch = 0;
const loginbtn = document.getElementById("login-button");
const registerbtn = document.getElementById("register-button");
const email = document.getElementById("email-div");
const logintitle = document.getElementById("login-title");
const registertitle = document.getElementById("register-title");



email.classList.add("hidden");
registerbtn.classList.add("hidden");


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

const Register = () => {
    const username = document.getElementById("username").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    clearError();
    fetch(`/movie-recommender/backend/api/register.php`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, email, password }),
    }).then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("User created successfully");
                localStorage.setItem("userid", data.user_id);
                window.location.href = "../index.html";
            } else {
                console.log("Error:", data.message);
                displayError(data.message || "An error occurred during registration.");
            }
        })
        .catch(error => {
            console.error("Fetch error:", error);
            displayError("Unable to register at this time. Please try again later.");
        });
}
const Login = () => {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    clearError();
    fetch(`/movie-recommender/backend/api/login.php`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
    }).then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("User Logged in");
                localStorage.setItem("userid", data.user_id);
                window.location.href = "../index.html";
            } else {
             displayError(data.message || "Invalid username or password.");
            }
        })
        .catch(error => {
            displayError("Unable to log in at this time. Please try again later.");
            console.error("Fetch error:", error);
        });
}

loginbtn.addEventListener("click", Login);
registerbtn.addEventListener("click", Register);
