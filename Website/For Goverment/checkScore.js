const data = {
    "categories": [
      {
        "name": "e-commerce",
        "dark_patterns": [
          "Sneaky subscription sign-ups",
          "Misleading pricing",
          "Forced continuity",
          "Scarcity tactics",
          "Hidden costs during checkout"
        ],
        "score_range": [7, 10]
      },
      {
        "name": "social-media",
        "dark_patterns": [
          "Manipulative notifications",
          "Confusing privacy settings",
          "Auto-opt-ins for data collection",
          "Addictiveness design"
        ],
        "score_range": [5, 8]
      },
      {
        "name": "news-media",
        "dark_patterns": [
          "Clickbait headlines",
          "Deceptive advertising",
          "Forced registration to access content",
          "Pre-checked newsletter subscriptions"
        ],
        "score_range": [3, 6]
      },
      {
        "name": "financial-services",
        "dark_patterns": [
          "Misleading terms and conditions",
          "Complex fee structures",
          "Confusing account cancellation processes",
          "Hidden charges"
        ],
        "score_range": [6, 9]
      },
      {
        "name": "travel-booking",
        "dark_patterns": [
          "False urgency",
          "Hidden fees during booking",
          "Pressure tactics",
          "Opt-out pre-selected add-ons"
        ],
        "score_range": [7, 10]
      },
      {
        "name": "gaming-gambling",
        "dark_patterns": [
          "Frequent pop-ups encouraging in-app purchases",
          "Manipulation of reward mechanisms",
          "Complex terms for bonuses",
          "Difficulty in account closure"
        ],
        "score_range": [8, 10]
      },
      {
        "name": "health-wellness",
        "dark_patterns": [
          "Misleading health claims",
          "Automatic subscription renewal",
          "Aggressive email marketing tactics",
          "Disguised advertisements as medical advice"
        ],
        "score_range": [4, 7]
      },
      {
        "name": "job-career",
        "dark_patterns": [
          "False job listings",
          "Undisclosed referral fees",
          "Exaggerated salary ranges",
          "Misleading job descriptions"
        ],
        "score_range": [3, 6]
      }
    ]
  }

const scoreRanges = {
    "e-commerce": { min: 6, max: 9 },
    "social-media": { min: 4, max: 7 },
    "news-media": { min: 5, max: 8 },
    "financial-services": { min: 7, max: 10 },
    "travel-booking": { min: 5, max: 8 },
    "gaming-gambling": { min: 3, max: 6 },
    "health-wellness": { min: 6, max: 9 },
    "job-career": { min: 8, max: 10 }
};

// const webtype = document.getElementById("webtype");
// const selectedType = webtype.value;

// function getWebType() {
//     console.log(selectedType);
//     const randomScore = getRandomScore(selectedType);
//     console.log("Random Score:", randomScore);
//     document.getElementById("scorePlaceholder").textContent = randomScore;
// }


// function getRandomScore(webCategory) {
//     const range = scoreRanges[webCategory];
//     return Math.floor(Math.random() * (range.max - range.min + 1)) + range.min;
// }


let selectedType;

const webtype = document.getElementById("webtype");

webtype.addEventListener('change', function() {
    selectedType = this.value;
});

function submitForm(e) {
  e.preventDefault(); // Prevent default form submission
  getWebType(); // Call getWebType function when form is submitted
}

function getWebType() {
  let selectedType = document.getElementById("webtype").value;

  if (!selectedType) {
      console.error('Web type not selected.');
      return;
  }

  console.log(selectedType);
  const randomScore = getRandomScore(selectedType);
  console.log("Random Score:", randomScore);
  document.getElementById("scorePlaceholder").textContent = randomScore;
  generatePieChart(selectedType); 
}


function getWebType() {

    if (!selectedType) {
        console.error('Web type not selected.');
        return;
    }

    console.log(selectedType);
    const randomScore = getRandomScore(selectedType);
    console.log("Random Score:", randomScore);
    document.getElementById("scorePlaceholder").textContent = randomScore;
    generatePieChart(selectedType); 
}

function getRandomScore(webCategory) {
    const range = scoreRanges[webCategory];
    return Math.floor(Math.random() * (range.max - range.min + 1)) + range.min;
}

let myChart; 

function generatePieChart(webType) {
    console.log("Selected Web Type:", webType);
    console.log("Data:", data);
    const selectedCategory = data.categories.find(category => category.name.toLowerCase() === webType.toLowerCase());
    if (!selectedCategory) {
        console.error(`Web type "${webType}" not found in data.`);
        return;
    }

    const darkPatterns = selectedCategory.dark_patterns;
    const ctx = document.getElementById('pieChart').getContext('2d');

    if (myChart) {
        myChart.destroy();
    }

    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: darkPatterns,
            datasets: [{
                label: 'Dark Patterns',
                data: darkPatterns.map(() => 1), // Dummy data, as we only need the labels
                backgroundColor: [
                    'red',
                    'blue',
                    'green',
                    'orange',
                    'purple',
                    // Add more colors as needed
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: false,
            maintainAspectRatio: false, // Allow the chart to be resized
            title: {
                display: true,
                text: `Dark Patterns in ${webType}`,
                fontColor: 'black', // Set the title text color to black
                fontSize: 18 // Set the title font size
            },
            legend: {
                labels: {
                    fontColor: 'black' // Set the legend text color to black
                }
            }
        }
    });
}

document.getElementById("certificationForm").addEventListener("submit", function(event) {
  var websiteName = document.getElementById("webname").value;
  var websiteUrl = document.getElementById("webUrl").value;
  var websiteType = document.getElementById("webtype").value;

  if (websiteName === "" || websiteUrl === "" || websiteType === "") {
      alert("Please fill out all fields");
      event.preventDefault(); // Prevent form submission
  }
});


