document.addEventListener('DOMContentLoaded', function() {
    // check for the model
    const modal = document.getElementById('newsletterModal');
    if (modal) {
      // display a warning
      console.warn('Potential dark pattern detected: Automatic newsletter subscription modal.');
    }
  });
  
  function closeModal() {
    const modal = document.getElementById('newsletterModal');
    modal.style.display = 'none';
  }
  
  function subscribe() {
    // Sucribe logic
    alert('Subscribed to the newsletter!');
    closeModal();
  }
  