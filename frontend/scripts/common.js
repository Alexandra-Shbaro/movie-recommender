
const header = document.querySelector("header");

if (!checkUserLoggedIn()) {

    if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="login-btn-header">Login</button>
          </a>
          <a href="/movie-recommender/frontend/pages/login.html">
              <button class="signup-btn-header">Signup</button>  
          </a> 
        </div>
        `;
    }

} else {
    if (header) {
        header.innerHTML += `
        <div class="buttons-wrapper">
           <a href="/movie-recommender/frontend/pages/my-account.html">
               <button class="myaccount-btn-header">My Account</button>  
           </a> 
         </div>`;
    }
}


function checkUserLoggedIn() {
    const user_id = localStorage.getItem("user_id");
    return !!user_id;
};
