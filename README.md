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

---

### Flask Application (Local Test)  
Tested Flask app locally with both endpoints.  
Visit:  
- [http://localhost:80](http://localhost:80)  
- [http://localhost:80/health](http://localhost:80/health)  

![Flask Local Test](screenshots/flask-local-test.png)  
![Flask Local Test - Console/GIF](https://github.com/user-attachments/assets/06175844-5f28-41bc-bcf0-dbbea7eb19db)  

---

### Architecture Diagram  
High-level overview of the Terraform-provisioned AWS environment.  
<img width="2259" height="1661" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/47b02ea4-8b0f-4602-94e1-6fa73aa97f60" />  

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
