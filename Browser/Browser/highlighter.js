// highlighter.js
console.log('Highlighter script loaded!');

// Function to highlight all links on the page
function highlightLinks() {
    const links = document.querySelectorAll('a');
    links.forEach(link => {
        link.style.backgroundColor = 'yellow';
        link.style.border = '2px solid red';
    });
}

// Function to remove highlighting from links
function removeHighlight() {
    const links = document.querySelectorAll('a');
    links.forEach(link => {
        link.style.backgroundColor = '';
        link.style.border = '';
    });
}

// Listen for messages from the extension
chrome.runtime.onMessage.addListener(function (message, sender, sendResponse) {
    if (message.action === 'highlightLinks') {
        highlightLinks();
        sendResponse({ success: true });
    } else if (message.action === 'removeHighlight') {
        removeHighlight();
        sendResponse({ success: true });
    }
});
