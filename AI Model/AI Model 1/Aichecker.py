import requests
from pprint import pprint

mytext = input("Enter text:")
response = requests.post(
    "https://api.sapling.ai/api/v1/aidetect",
    json={
        "key": "4KUJMMC886VPWQMQUOW2MRNEZLX0REFQ",
        "text": mytext
    }
)
response_Dict = response.json()
score = response_Dict['score']
print(f"This phrase is {round(score*100,2)}% likely to be a Dark Patten, be aware!!!")
print("Detailed Review:")
pprint(response.json())
print("Thank you for using this program to detect dark pattern buster developed by team 'TECH ENCHANTERS' of Chandigarh University")


