import json
import requests
import urllib
import pandas as pd

class IPQS:
    key = 'GQNWfzROpleQ0AXMwIMZtLTobllWgc3V'

    def malicious_url_scanner_api(self, url: str, vars: dict = {}) -> dict:
        url = 'https://www.ipqualityscore.com/api/json/url/%s/%s' % (self.key, urllib.parse.quote_plus(url))
        x = requests.get(url, params=vars)
        print(x.text)
        return (json.loads(x.text))


if __name__ == "__main__":
    """
    URL to scan - URL Encoded in cURL function below.
    """
    URL = 'https://www.amazon.in/ref=nav_logo'

    # Adjustable strictness level from 0 to 2. 0 is the least strict and recommended for most use cases. Higher strictness levels can increase false-positives.
    strictness = 0

    # custom feilds
    additional_params = {
        'strictness': strictness
    }

    ipqs = IPQS()
    result = ipqs.malicious_url_scanner_api(URL, additional_params)

    if 'success' in result and result['success'] == True:
        df = pd.DataFrame(result)
        print(df)
        print(result)
        for name in result:
            print(name,":",result[name])
        """
        NOTICE: If you want to use one of the examples below, remove
        any lines containing  comments
        """

        
        # Example 1: Identify suspicious URLs regardless of Risk Score

        if result['suspicious'] == True:
            URL = "amazon.com"
        
        

        """
        - Example 2: We'd like to block all malicious URLs suspected of being used for phishing or malware

        if result['phishing'] == True or result['malware'] === True or result['risk_score'] > 85):
            # flag high risk URLs likely to be malicious
        }
        """

        """
        - Example 3: We'd like to block all links on parked domains

        if result['parking'] == True:
        	# flag parked domains
        }
        """

        """
        If you are confused with these examples or simply have a use case
        not covered here, please feel free to contact IPQualityScore's support
        team. We'll craft a custom piece of code to meet your requirements.
        """
print("Thank you for using this program to detect dark pattern buster developed by team 'Sharktooth' of Chandigarh University")
