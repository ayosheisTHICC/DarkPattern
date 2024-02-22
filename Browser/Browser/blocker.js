// blocker.js
console.log("Blocker Script Loaded");

// Example: Block all images on the page
document.querySelectorAll('img').forEach(image => {
    image.style.display = 'none';
});
