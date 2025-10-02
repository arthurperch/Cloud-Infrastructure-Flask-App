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
Terraform / AWS Setup
## 📸 Screenshots  
#Equal
<img width="1357" height="312" alt="solution terraforms for free verson" src="https://github.com/user-attachments/assets/49148c83-6a38-4e0b-b5b3-9a14c3e809f4" />
AWS CLI configure
<img width="279" height="229" alt="Screenshot 2025-09-28 141022" src="https://github.com/user-attachments/assets/fa6987e4-4d93-4761-82e0-ef19b37226e6" />
Free Tier eligibility
<img width="654" height="74" alt="Screenshot 2025-09-28 141800" src="https://github.com/user-attachments/assets/ac90ef4e-d518-49f3-a423-2f05acef8975" />
#Equal
### Terraform Deployment  
Terraform successfully initialized and applied infrastructure.  
![Terraform Apply](screenshots/terraform-apply-success.png)  

---

### AWS Setup  
Configured AWS CLI and confirmed Free Tier eligibility.  
![AWS Configure](screenshots/aws-configure.png)  
![EC2 Free Tier Check](screenshots/ec2-free-tier-check.png)  

---

### EC2 Instance Running  
EC2 instance provisioned successfully via Terraform.  
<img width="2048" height="1031" alt="ec2_screenshot_blurred" src="https://github.com/user-attachments/assets/0b3aba1d-127a-488f-a580-a141d80d2f79" />  

#Equal
EC2 console (instance running)
<img width="669" height="138" alt="Screenshot 2025-09-28 141912" src="https://github.com/user-attachments/assets/6b9f16a6-ce90-4e8e-a05e-916fb4b0198b" />
<img width="1870" height="492" alt="Screenshot 2025-10-01 203618" src="https://github.com/user-attachments/assets/d52509d2-5f5e-4d5b-ba68-e4cbccadd25e" />
<img width="1893" height="1695" alt="Screenshot 2025-10-01 204112" src="https://github.com/user-attachments/assets/234985d5-f8d4-4667-aeca-ec8a5d5aab53" />

SSH login session
<img width="541" height="201" alt="Linux EC2 install python and confirm version" src="https://github.com/user-attachments/assets/40b7d6c6-1ca6-4ef2-bece-0146f0706e15" />
EC2 is running + Python installed
#Equal
---

### Flask Application (Local Test)  
Tested Flask app locally with both endpoints.  
Visit:  
  <img width="680" height="224" alt="Screenshot 2025-09-28 142859" src="https://github.com/user-attachments/assets/0d8ba144-09fc-443c-9284-4ee664529d69" />
  e’ll install a version of Flask that works with Python 3.7. That’s Flask
![Flask Local Test](screenshots/flask-local-test.png)  
![Flask Local Test - Console/GIF](https://github.com/user-attachments/assets/06175844-5f28-41bc-bcf0-dbbea7eb19db)  
Flask version: We’ll install a version of Flask that works with Python 3.7. That’s Flask 2.2.5
<img width="930" height="215" alt="WeΓÇÖll install a version of Flask that works with Python 3 7  ThatΓÇÖs Flask 2 2 5" src="https://github.com/user-attachments/assets/0ca45639-28ed-407b-9715-0ce560a9ac6d" />

---

Flask App (EC2 Public)
App working via Nginx on public IP
<img width="1753" height="475" alt="port80test" src="https://github.com/user-attachments/assets/d400b263-3d31-4667-8eb1-acd446938981" />
EC2 terminal showing Flask service
<img width="1906" height="1839" alt="Screenshot 2025-10-01 223810" src="https://github.com/user-attachments/assets/30ba40ec-2e0f-4644-abd2-cb1b97bbacd1" />


Nginx Reverse Proxy
<img width="1807" height="1081" alt="Screenshot 2025-10-02 001415" src="https://github.com/user-attachments/assets/2aedddf1-363f-4a47-8550-d406e7fccd7c" />



### Architecture Diagram  
High-level overview of the Terraform-provisioned AWS environment.  

<img width="2259" height="1661" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/47b02ea4-8b0f-4602-94e1-6fa73aa97f60" /> 
Nginx config (/etc/nginx/conf.d/flask.conf)
<img width="1813" height="165" alt="Screenshot 2025-10-02 000102" src="https://github.com/user-attachments/assets/cc3498a0-15ca-48a8-badc-2a4e98f429b4" />

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
