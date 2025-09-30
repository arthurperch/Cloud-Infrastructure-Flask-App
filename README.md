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

<img width="2259" height="1661" alt="image" src="https://github.com/user-attachments/assets/bed0fa26-ccee-4f73-ab12-fc910142beb4" />
