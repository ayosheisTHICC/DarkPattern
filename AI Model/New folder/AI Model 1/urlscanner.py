import json
import requests
import urllib
import pandas as pd


class IPQS:
    API_KEY = 'GQNWfzROpleQ0AXMwIMZtLTobllWgc3V'

    def __init__(self, key):
        self.key = key

    def malicious_url_scanner_api(self, url: str, params: dict = {}) -> dict:
        endpoint = f'https://www.ipqualityscore.com/api/json/url/{self.key}/{urllib.parse.quote_plus(url)}'
        response = requests.get(endpoint, params=params)

        try:
            response.raise_for_status()
            return json.loads(response.text)
        except requests.exceptions.HTTPError as errh:
            print("HTTP Error:", errh)
        except requests.exceptions.ConnectionError as errc:
            print("Error Connecting:", errc)
        except requests.exceptions.Timeout as errt:
            print("Timeout Error:", errt)
        except requests.exceptions.RequestException as err:
            print("Something went wrong:", err)


if __name__ == "__main__":
    URL = 'https://www.amazon.in/ref=nav_logo'
    strictness = 0
    additional_params = {'strictness': strictness}

    ipqs = IPQS(key='your_api_key_here')  # Replace with your actual API key
    result = ipqs.malicious_url_scanner_api(URL, additional_params)

    if 'success' in result and result['success']:
        for key, value in result.items():
            print(f'{key}: {value}')

        if result['suspicious']:
            print("The URL is suspicious.")
