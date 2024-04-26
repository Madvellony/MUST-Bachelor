// Menu Toggle 
// Цэс солих, навигацын холбоосны хувьсагчдыг тохируулах
const menuToggle = document.querySelector('#showMenu');
const navLink = document.querySelector('#navLinks');
const hideBar = document.querySelector('#hideBar');
const barTop = document.querySelector('#barTop');
const barBottom = document.querySelector('#barBottom');

// Цэсийг харуулах
if (menuToggle) {
    menuToggle.addEventListener('click', (e) => {
        navLink.classList.toggle('show-menu');
        hideBar.classList.toggle('hide-bar');
        barTop.classList.toggle('rotate-bar-top');
        barBottom.classList.toggle('rotate-bar-bottom');
    });
}


// дээш гүйлгэх button
const scrollToTop = document.querySelector('#scrollButton');

// scroll
window.addEventListener("scroll", () => {

    // Одоогийн гүйлгэх өндрийн утгыг авна уу
    const windowHeight = window.scrollY;

    // Хэрэв гүйлгэх өндрийн утга нь цонхны өндрөөс их байвал товчлуур дээр inline-css загварыг нэмнэ үү 
    if (windowHeight > 500) {
        scrollToTop.style.display = 'block';
    } else {
        scrollToTop.style.display = 'none';
    }
});


// Setup a function with animate scroll to top slower / smoother
const animateScroll = () => {

    // Set a variable for the number of pixels from the top of the document.
    const heightScroll = document.documentElement.scrollTop || document.body.scrollTop;

    // If heightScroll value is greater than 0, scroll to top of the document.
    // Animate scroll with method requestAnimationFrame:
    if (heightScroll > 0) {
        window.requestAnimationFrame(animateScroll);

        // ScrollTo takes x and y coordinate.
        // Increase the '15' value to get a smoother/slower scroll
        window.scrollTo(0, heightScroll - heightScroll / 15);
    }
}

// When the button clicked, run animateScroll function
scrollToTop.onclick = function () {
    animateScroll();
}