
//Mobile menu toggle
document.getElementById('mobile-menu').addEventListener('click', function() {
    document.querySelector('nav ul').classList.toggle('showing');
});

//Smooth transition for mobile menu
document.getElementById('mobile-menu').addEventListener('click', function() {
    document.querySelector('nav ul').classList.toggle('showing');
    document.querySelector('nav ul').style.transition = 'max-height 0.5s ease-in-out';
});

// Form validation
document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();
    let isValid = true;
    const name = document.getElementById('name');
    const email = document.getElementById('email');
    const message = document.getElementById('message');

    if (name.value.trim() === '') {
        isValid = false;
        alert('Please enter your name');
    }

    if (email.value.trim() === '') {
        isValid = false;
        alert('Please enter your email');
    } else if (!validateEmail(email.value.trim())) {
        isValid = false;
        alert('Please enter a valid email');
    }

    if (message.value.trim() === '') {
        isValid = false;
        alert('Please enter your message.');
    }

    if (isValid) {
        this.submit();
    }
});

function validateEmail(emial) {
    const re = /^[a-zA-Z0-9._-] + @[a-zA-Z0-9.-] + \.[a-zA-Z]{2,6}$/;
    return re.test(String(email).toLowerCase());
};