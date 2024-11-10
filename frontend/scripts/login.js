let userswitch=0;
const loginbtn = document.getElementById("login-button");
const registerbtn = document.getElementById("register-button");
const email = document.getElementById("email-div");
const logintitle = document.getElementById("login-title");
const registertitle = document.getElementById("register-title");




email.classList.add("hidden");
registerbtn.classList.add("hidden");
let switchtoRegister = ()=>{
    if(userswitch===0){
        email.classList.toggle("hidden");
        registerbtn.classList.toggle("hidden");
        loginbtn.classList.toggle("hidden")
        gsap.to(".line",{duration:0.5,x:275})
        userswitch=1;
    }
}
registertitle.addEventListener("click",switchtoRegister);

let switchtoLogin = ()=>{
    if(userswitch===1){
        email.classList.toggle("hidden");
        registerbtn.classList.toggle("hidden");
        loginbtn.classList.toggle("hidden")
        gsap.to(".line",{duration:0.5,x:0})
        userswitch=0;
    }
}
logintitle.addEventListener("click",switchtoLogin);
