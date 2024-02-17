const darkPatterns = [
    {
      name: "Hidden Costs",
      description:
        "This dark pattern involves hiding additional costs or fees until the user is further into the purchasing process.",
      companies: [
        "Stuff",
        "Google",
        "BBC",
        "YouTube",
        "Facebook",
        "Wikipedia",
        "TradeMe",
        "Yahoo",
        "Amazon",
        "MSN",
        "LinkedIn",
        "eBay",
        "Yahoo (NZ)",
        "Tumblr",
        "Blogger",
        "Microsoft",
        "CNN",
        "Flickr",
        "Wix",
        "Eventbrite",
      ],
    },
    {
      name: "Bait and Switch",
      description:
        "Involves advertising a product or service at a lower price to attract customers, but then presenting a different, usually higher-priced, item.",
      companies: [
        "Stuff",
        "TradeMe",
        "eBay",
        "Tumblr",
        "Blogger",
        "Wix",
        "Amazon (NZ)",
        "pornhub",
      ],
    },
    {
      name: "Privacy Zuckering",
      description:
        "Refers to deceptive practices aimed at tricking users into sharing more personal information than they intended to.",
      companies: [
        "Google",
        "Facebook",
        "BBC",
        "YouTube",
        "Wikipedia",
        "Microsoft",
        "CNN",
        "Live",
        "Imgur",
        "Apple",
        "Wordpress (org)",
        "Flickr",
        "Yahoo (NZ)",
        "Disqus",
        "Craigslist",
        "Behance",
        "Medium",
        "Ucoz",
        "Canva",
      ],
    },
    {
      name: "Misdirection",
      description:
        "This dark pattern involves guiding or redirecting users' attention away from important information or actions.",
      companies: [
        "Google",
        "BBC",
        "YouTube",
        "LinkedIn",
        "MSN",
        "Tumblr",
        "Live",
        "Imgur",
        "Microsoft",
        "CNN",
        "Flickr",
        "Yahoo (NZ)",
        "Steam",
        "Disqus",
        "Craigslist",
        "Canva",
      ],
    },
    {
      name: "Roach Motel",
      description:
        "Involves making it easy for users to get into a certain situation or contract, but difficult for them to get out of it.",
      companies: [
        "BBC",
        "Wikipedia",
        "LinkedIn",
        "eBay",
        "NYTimes",
        "Vimeo",
        "Medium",
        "Ucoz",
      ],
    },
    {
      name: "Confirmshaming",
      description:
        "Refers to manipulative tactics aimed at pressuring users into taking a certain action or decision by making them feel guilty or ashamed.",
      companies: [
        "Reddit",
        "LinkedIn",
        "Pinterest",
        "Disqus",
        "Imgur",
        "Canva",
      ],
    },
    {
      name: "Forced Continuity",
      description:
        "Involves automatically enrolling users into subscription or recurring payment plans without their explicit consent.",
      companies: [
        "Netflix",
        "Google",
        "LinkedIn",
        "Spotify",
        "Dropbox",
        "PayPal",
        "Adobe",
        "Salesforce",
        "Microsoft",
        "eBay",
        "Flickr",
        "Eventbrite",
        "Shopify",
        "Zillow",
        "Alibaba",
        "Baidu",
        "Razer",
        "Samsung",
        "Sony",
        "LG",
        "BMW",
        "Audi",
      ],
    },
    {
      name: "Sneak into Basket",
      description:
        "Refers to adding items to a user's shopping cart or basket without their explicit consent or knowledge.",
      companies: [
        "Google",
        "Amazon",
        "Facebook",
        "YouTube",
        "Pinterest",
        "Spotify",
        "Vimeo",
        "Twitter",
        "Instagram",
        "Netflix",
        "Dropbox",
        "PayPal",
        "Adobe",
        "Salesforce",
        "Microsoft",
        "eBay",
        "Flickr",
        "Steam",
        "Nintendo",
        "Xbox",
        "PlayStation",
        "Logitech",
        "Bose",
        "JBL",
        "Beats",
        "Samsung Electronics",
        "Huawei",
        "Xiaomi",
        "OnePlus",
        "Google Pixel",
        "Samsung Galaxy",
        "Apple iPhone",
        "Sony Xperia",
        "LG Velvet",
        "Nokia",
        "HTC",
        "Asus",
        "Motorola",
        "BlackBerry",
        "Lenovo",
        "Acer",
        "Dell",
        "Apple Music",
        "Pandora",
        "Twitch",
        "Epic Games",
        "Nintendo",
        "PlayStation",
        "Xbox",
        "Razer",
        "Logitech",
        "Corsair",
        "Sennheiser",
        "Bose",
        "JBL",
        "Beats",
      ],
    },
  ];


const searchInput = document.getElementById('searchInput');
const searchButton = document.getElementById('searchButton');
const resultsContainer = document.getElementById('results');

function displayResults(results) {
    resultsContainer.innerHTML = ''; // Clear previous results
    if (results.length === 0) {
        resultsContainer.innerHTML = '<p>No results found.</p>';
        return;
    }
    results.forEach(pattern => {
        const company = pattern.companies[0]; // For simplicity, taking only the first company
        const card = document.createElement('div');
        card.classList.add('card');
        card.innerHTML = `
            <h2>${pattern.name}</h2>
            <p>${pattern.description}</p>
        `;
        resultsContainer.appendChild(card);
    });
}

searchButton.addEventListener('click', function(event) {
    event.preventDefault();
    const searchTerm = searchInput.value.trim();
    const results = darkPatterns.filter(pattern => pattern.companies.includes(searchTerm));
    displayResults(results);
});