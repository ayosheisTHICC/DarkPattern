document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('newsletterModal');
  if (modal) {
   
    console.warn('dark pattern detected: Automatic newsletter subscription modal.');
    
   
    setTimeout(() => {
      modal.style.display = 'block';
    }, 5000);
    
   
    const closeBtn = document.querySelector('.close');
    closeBtn.addEventListener('click', function() {
      if (!closeBtn.disabled) {
        closeModal();
        closeBtn.disabled = true;
        console.warn('Potential dark pattern detected: Attempted to close modal too quickly.');
      }
    });
  }
});

function closeModal() {
  const modal = document.getElementById('newsletterModal');
  modal.style.display = 'none';
}

function subscribe() {
 
  alert('u clicked on subscribe!');
  closeModal();
}
