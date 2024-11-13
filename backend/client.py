import requests
import json

C_URL = "http://127.0.0.1:8000/student/create/"
U_URL = "http://127.0.0.1:8000/student/update/15/"

data = {
    "name": "Dua",
    "city": "Rahim"
}

# Create Student
# response = requests.post(url=C_URL, json=data)

# Delete Student By Id
# response = requests.delete(url=URL)

# Get Student By Id
# response = requests.get(url=URL)

# Put Request
response = requests.put(url=U_URL, json=data)

print("Status Code:", response.status_code)
print("Response Data:", response.json()) 
# print("Response Data:", response.headers) 
