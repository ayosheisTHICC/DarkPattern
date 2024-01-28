const patternConfig = {
    patterns: [
     

        // Example Countdown Pattern
        {
            name: "Example Countdown",
            className: "example-countdown",
            detectionFunctions: [
                function (node) {
                    // Example: Detect a countdown pattern if the text contains "minutes left"
                    return /(\d+:\d+)\s*minutes left/i.test(node.innerText);
                }
            ],
            infoUrl: "https://example.com/countdown-info",
            info: "An example countdown pattern.",
            languages: ["en"]
        }
    ]
};
