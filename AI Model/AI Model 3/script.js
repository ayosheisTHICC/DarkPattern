document.addEventListener('DOMContentLoaded', function() {
  // Check for the presence of the modal on page load
  const modal = document.getElementById('newsletterModal');
  if (modal) {
    // Display a warning or take appropriate action
    console.warn('Potential dark pattern detected: Automatic newsletter subscription modal.');
  }
});

function closeModal() {
  const modal = document.getElementById('newsletterModal');
  modal.style.display = 'none';
}

function subscribe() {
  // Implement the subscribe logic here
  alert('Subscribed to the newsletter!');
  closeModal();
}
