# cloud-p1
End-to-end AWS project: Terraform-deployed 3-tier Flask app with VPC, EC2, ALB, and RDS. Includes CI/CD (GitHub Actions + CodeDeploy), HTTPS/TLS, CloudWatch monitoring, IAM least privilege, WAF, and cost optimization. Features runbooks + incident logs for real-world ops workflows.




What this does:
/ endpoint: Returns "Hello from cloud-p1 🚀" as requested
/health endpoint: Returns "OK" for health checks/monitoring
Runs on port 80: Matches the security group configuration
Binds to 0.0.0.0: Accepts connections from any IP (required for public access)
Commands to test locally:cd app/
python app.py
# Visit: http://localhost:80 and http://localhost:80/health<img width="1530" height="1010" alt="Host HTTP testing port80" src="https://github.com/user-attachments/assets/2a0077f8-6b37-4390-8667-ab63239ec214" />
