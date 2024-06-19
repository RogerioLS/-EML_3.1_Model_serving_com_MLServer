import requests
import json

url = "http://localhost:8080/v2/models/iris_model/infer"

payload = {
    "inputs": [
        {
            "name": "input-0",
            "shape": [1, 4],
            "datatype": "FP32",
            "data": [5.1, 3.5, 1.4, 0.2]
        }
    ]
}

headers = {"Content-Type": "application/json"}

response = requests.post(url, data=json.dumps(payload), headers=headers)

print("Resposta do servidor:", response.status_code)
print(response.json())
