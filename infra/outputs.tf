# Show the public IP of your EC2 after build
output "ec2_public_ip" {
  value = aws_instance.app.public_ip
}

# Show the instance ID (unique EC2 identifier)
output "ec2_id" {
  value = aws_instance.app.id
}
