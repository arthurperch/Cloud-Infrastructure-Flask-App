# cloud-p1  

End-to-end AWS project deploying a 3-tier Flask application with Terraform.  
Built to demonstrate real-world cloud engineering practices including Infrastructure as Code (IaC), application deployment, monitoring, and security hardening.  

---

## 🌐 Current Status  

- ✅ Infrastructure deployed via Terraform (VPC, subnet, IGW, security group, EC2)  
- ✅ EC2 instance running Amazon Linux 2, accessible via SSH and HTTP  
- ✅ Flask app created and tested locally with `/` and `/health` endpoints  
- 🔄 Next: Deploy Flask app onto EC2 instance  

---

# Visit: http://localhost:80 and http://localhost:80/health<img width="1530" height="1010" alt="Host HTTP testing port80" src="https://github.com/user-attachments/assets/2a0077f8-6b37-4390-8667-ab63239ec214" />

### Flask app running locally  
![Local Flask Test](<img-link>)  

### AWS EC2 instance running  
![EC2 Screenshot](<img-link>)  

### Architecture diagram  
![Architecture Diagram](<img-link>)  

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
<img width="2259" height="1661" alt="image" src="https://github.com/user-attachments/assets/bed0fa26-ccee-4f73-ab12-fc910142beb4" />
