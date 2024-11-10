import requests
import json

URL = "http://127.0.0.1:8000/student/update/15/"

data = {
    "name": "Mubasher Hussain",
    "roll": 103,
    "city": "Gujranwala"
}

# Create Student
# response = requests.post(url=URL, json=data)

# Delete Student By Id
# response = requests.delete(url=URL)

# Get Student By Id
# response = requests.get(url=URL)

# Put Request
response = requests.put(url=URL, json=data)

print("Status Code:", response.status_code)
print("Response Data:", response.json()) 
