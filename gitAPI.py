import requests
import json

# Make 3 requests to the api and store data in events
url = "https://api.github.com/events"
for req in range(3):
    res = requests.get(url)
    events = json.loads(res.content)

    # If an email is found, print the email address, if not,
    # print the ID of the message
    for obj in events:
        try:
            for email in obj['payload']['commits']:
                print(email['author']['email'])
        except:
            print("No email addresses found - " + obj['id'])