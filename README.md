# cloud-p1
End-to-end AWS project: Terraform-deployed 3-tier Flask app with VPC, EC2, ALB, and RDS. Includes CI/CD (GitHub Actions + CodeDeploy), HTTPS/TLS, CloudWatch monitoring, IAM least privilege, WAF, and cost optimization. Features runbooks + incident logs for real-world ops workflows.

Step 2: Flask App Added (tested locally, works)
edit "appy.py"
Make changes: # Import Flask (tiny Python web framework)
from flask import Flask

# Create Flask app object
app = Flask(__name__)

# Define a route: when someone visits "/"
@app.route("/")
def home():
    return "Hello from cloud-p1 🚀"

# Health check endpoint for monitoring
@app.route("/health")
def health():
    return "OK"

# Run app only if script is executed directly
if __name__ == "__main__":
    # Start Flask server on port 80 (so browser can reach it)
    app.run(host="0.0.0.0", port=80)


What this does:
/ endpoint: Returns "Hello from cloud-p1 🚀" as requested
/health endpoint: Returns "OK" for health checks/monitoring
Runs on port 80: Matches the security group configuration
Binds to 0.0.0.0: Accepts connections from any IP (required for public access)
Commands to test locally:cd app/
python app.py
# Visit: http://localhost:80 and http://localhost:80/health<img width="1530" height="1010" alt="Host HTTP testing port80" src="https://github.com/user-attachments/assets/2a0077f8-6b37-4390-8667-ab63239ec214" />

SUMMARY:
What Changed:
Fixed typo: requirments.txt → requirements.txt
Added /health endpoint returning "OK"
Full File Contents:
app.py


# Import Flask (tiny Python web framework)
from flask import Flask

# Create Flask app object
app = Flask(__name__)

# Define a route: when someone visits "/"
@app.route("/")
def home():
    return "Hello from cloud-p1 🚀"

# Health check endpoint for monitoring
@app.route("/health")
def health():
    return "OK"

# Run app only if script is executed directly
if __name__ == "__main__":
    # Start Flask server on port 80 (so browser can reach it)
    app.run(host="0.0.0.0", port=80)
📐 Architecture Diagram

The current cloud infrastructure is provisioned on AWS using Terraform. The deployment includes the following components:

VPC (10.0.0.0/16) → A private network for all resources.

Public Subnet (10.0.1.0/24) → A subnet inside the VPC with internet access.

Internet Gateway (IGW) → Enables communication between the VPC and the internet.

Route Table → Routes outbound traffic (0.0.0.0/0) through the IGW.

Security Group → Configured to allow inbound HTTP (port 80) and SSH (port 22), with unrestricted outbound access.

EC2 Instance (Amazon Linux 2) → A t3.micro instance running in the public subnet with a public IPv4 address.

Current State

Infrastructure fully deployed with Terraform.

Public IP assigned to EC2 instance.

Instance accessible via SSH (port 22).

Security group allows HTTP (port 80).

Flask application prepared locally for deployment.

Next Step

Deploy the Flask application onto the EC2 instance.

Application endpoints will be exposed:

/ → returns “Hello from cloud-p1 🚀”

/health → returns “OK”
<img width="2259" height="1661" alt="image" src="https://github.com/user-attachments/assets/bed0fa26-ccee-4f73-ab12-fc910142beb4" />
