let slideIndex = 0;
const slides = [
    'assets/images/Thething.jpeg',
    'assets/images/noel.jpg',
    'assets/images/venom.jpeg',
    'assets/images/theCrow.jpg'
];

const container = document.querySelector('.hero');

function showSlides() {
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }
    container.style.backgroundImage = `url(${slides[slideIndex - 1]})`;

    setTimeout(showSlides, 3000); // Change image every 2 seconds
}

// Initialize the slideshow
showSlides();