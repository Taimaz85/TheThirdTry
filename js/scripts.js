
// Toggle configuration
document.getElementById('mobile-menu').addEventListener('click', function() {
    var navLinks = document.querySelector('nav ul');
    navLinks.classList.toggle('showing');

    // Toggle the cross icon
    this.classList.toggle('toggle');
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

function validateEmail(email) {
    const re = /^[a-zA-Z0-9._-] + @[a-zA-Z0-9.-] + \.[a-zA-Z]{2,6}$/;
    return re.test(String(email).toLowerCase());
};