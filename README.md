# Cloud Infrastructure with Flask App

End-to-end AWS project deploying a 3-tier Flask application with Terraform.  
Built to demonstrate real-world cloud engineering practices including Infrastructure as Code (IaC), application deployment, monitoring, and security hardening.  

---

## 🌐 Current Status  

- ✅ Infrastructure deployed via Terraform (VPC, subnet, IGW, security group, EC2)  
- ✅ EC2 instance running Amazon Linux 2, accessible via SSH and HTTP  
- ✅ Flask app created and tested locally with `/` and `/health` endpoints  
- 🔄 Next: Deploy Flask app onto EC2 instance  

---

## 📸 Screenshots  

### Local Flask App  
Visit:  
- [http://localhost:80](http://localhost:80)  
- [http://localhost:80/health](http://localhost:80/health)  

<img width="1530" height="1010" alt="Host HTTP testing port80" src="https://github.com/user-attachments/assets/2a0077f8-6b37-4390-8667-ab63239ec214" />

![compressedcloudp1cmdhostingtest](https://github.com/user-attachments/assets/06175844-5f28-41bc-bcf0-dbbea7eb19db)

---

### AWS EC2 Instance Running  
<img width="2048" height="1031" alt="ec2_screenshot_blurred" src="https://github.com/user-attachments/assets/0b3aba1d-127a-488f-a580-a141d80d2f79" />

---

### Architecture Diagram  
<img width="2259" height="1661" alt="495527079-bed0fa26-ccee-4f73-ab12-fc910142beb4" src="https://github.com/user-attachments/assets/47b02ea4-8b0f-4602-94e1-6fa73aa97f60" />

---

## 🐍 Flask Application  

Endpoints:  
- `/` → **Hello from cloud-p1 🚀**  
- `/health` → **OK**  

<details>
<summary>app.py (click to expand)</summary>

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from cloud-p1 🚀"

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
