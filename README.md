# Cloud Infrastructure with Flask App  

End-to-end AWS project deploying a 3-tier Flask application with Terraform.  
Built to demonstrate real-world cloud engineering practices including Infrastructure as Code (IaC), application deployment, monitoring, and security hardening.  

---

## 🌐 Current Status  

- ✅ Infrastructure deployed via Terraform (VPC, subnet, IGW, security group, EC2)  
- ✅ EC2 instance running Amazon Linux 2, accessible via SSH and HTTP  
- ✅ Flask app created and tested locally with `/` and `/health` endpoints  
- ✅ Nginx reverse proxy serving app on port 80  
- 🔄 Next: Replace Flask dev server with Gunicorn + systemd  

---

## 📸 Screenshots  

### Terraform Deployment  
Terraform successfully initialized and applied infrastructure.  
![Terraform Apply](screenshots/terraform-apply-success.png)  

---

### AWS Setup  
AWS CLI configured and Free Tier eligibility verified.  
![AWS Configure](screenshots/aws-configure.png)  
![EC2 Free Tier Check](screenshots/ec2-free-tier-check.png)  

---

### EC2 Instance Running  
Provisioned successfully with Terraform and accessible via AWS Console & SSH.  

**EC2 Console (running instance):**  
![EC2 Console](screenshots/ec2-console.png)  

**SSH login + Python installed:**  
![EC2 SSH Login](screenshots/ec2-ssh-login.png)  

---

### Flask Application (Local Test)  
Tested Flask app locally with both endpoints.  

Visit locally:  
- [http://localhost:80](http://localhost:80)  
- [http://localhost:80/health](http://localhost:80/health)  

![Flask Local Test](screenshots/flask-local-test.png)  
![Flask Local Console](screenshots/flask-local-console.gif)  

---

### Flask Application (Public on EC2)  
Deployed Flask app on EC2 behind Nginx reverse proxy.  

**Public IP serving app on port 80:**  
![Flask Public IP](screenshots/flask-public-ip.png)  

**Nginx config file:**  
![Nginx Config](screenshots/nginx-config.png)  

---

### Architecture Diagram  
High-level overview of the Terraform-provisioned AWS environment.  
![Architecture Diagram](screenshots/architecture-diagram.png)  

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
