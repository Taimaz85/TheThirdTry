// Handle button click to reveal links
const revealButtons = document.querySelectorAll('.revealButton');
revealButtons.forEach(button => {
    button.addEventListener('click', () => {
        const targetBlock = document.getElementById(button.getAttribute('data-target'));
        targetBlock.classList.toggle('visible');
    });
});

// Handle link clicks to open forms
const formLinks = document.querySelectorAll('.formLink');
formLinks.forEach(link => {
    link.addEventListener('click', (event) => {
        event.preventDefault();
        const formId = link.getAttribute('data-form');
        document.getElementById(formId).style.display = 'block';
    });
});

// Handle close button clicks to close modals
const closeButtons = document.querySelectorAll('.close');
closeButtons.forEach(button => {
    button.addEventListener('click', () => {
        const formId = button.getAttribute('data-close');
        document.getElementById(formId).style.display = 'none';
    });
});

// Close modal if clicked outside the modal content
window.addEventListener('click', (event) => {
    if (event.target.classList.contains('modal')) {
        event.target.style.display = 'none';
    }
});
