var fileUrl = chrome.runtime.getURL('fake_dataset.txt'); // Using a fake dataset
console.log(fileUrl);

fetch(fileUrl)
  .then(response => response.text())
  .then(content => {
    // Taking input in an array
    const arr = content.split('\n').filter(Boolean);
    var words = arr.map(element => element.replace('\r', ''));
    var bodyText = document.body.innerHTML;
    var matchCounter = 0;

    for (var i = 0; i < words.length; i++) {
      var regex = new RegExp(words[i], 'gi');
      bodyText = bodyText.replace(regex, function(match) {
        matchCounter++;

        // Dark Pattern 1: Randomly change the case of matched words
        if (Math.random() > 0.5) {
          return '<mark>' + match.toUpperCase() + '</mark>';
        } else {
          return '<mark>' + match.toLowerCase() + '</mark>';
        }
      });
    }

    // Dark Pattern 2: Add a fake loading spinner to deceive the user
    document.body.innerHTML = '<div class="fake-spinner"></div>' + bodyText;

    // Sending dark patterns count to popup.js
    sendMatchCounter(matchCounter);
    
    // Detect Dark Patterns
    detectDarkPatterns(bodyText);
  });

function sendMatchCounter(counter) {
  // Dark Pattern 3: Introduce a delay before sending the counter
  setTimeout(function() {
    chrome.runtime.sendMessage({ action: 'sendMatchCounter', matchCounter: counter });
  }, 2000); // 2 seconds delay
}

function detectDarkPatterns(text) {
  // Dark Pattern 4: Check for deceptive wording
  if (text.includes('exclusive offer') && text.includes('limited time')) {
    alert('Possible deceptive wording: Exclusive offer with limited time!');
  }

  // Dark Pattern 5: Check for hidden fees
  if (text.includes('hidden fee')) {
    alert('Possible hidden fees detected!');
  }

  // Dark Pattern 6: Check for forced continuity
  if (text.includes('auto-renew') && text.includes('subscription')) {
    alert('Possible forced continuity: Auto-renewing subscription detected!');
  }

  // Dark Pattern 7: Check for privacy issues
  if (text.includes('privacy policy') && text.includes('data sharing')) {
    alert('Possible privacy issues: Data sharing in the privacy policy detected!');
  }

  // Dark Pattern 8: Check for misleading defaults
  if (text.includes('default option') && text.includes('change')) {
    alert('Possible misleading defaults: Default option may lead to unintended changes!');
  }

  // Dark Pattern 9: Check for disguised ads
  if (text.includes('sponsored content') && text.includes('not an ad')) {
    alert('Possible disguised ads: Sponsored content falsely presented as non-ad content!');
  }

  // Dark Pattern 10: Check for trick questions
  if (text.includes('trick question') && text.includes('misleading')) {
    alert('Possible trick questions: Misleading questions detected!');
  }
}
