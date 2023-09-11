resource "aws_instance" "jenkins_instance" {
 #checkov:skip=CKV_AWS_135: "Ensure that EC2 is EBS optimized"
 #checkov:skip=CKV_AWS_126: "Ensure that detailed monitoring is enabled for EC2 instances"
 #checkov:skip=CKV_AWS_79: "Ensure Instance Metadata Service Version 1 is not enabled"
 #checkov:skip=CKV_AWS_8: "Ensure all data stored in the Launch configuration or instance Elastic Blocks Store is securely encrypted"
 #checkov:skip=CKV2_AWS_41: "Ensure an IAM role is attached to EC2 instance"
  ami           = var.aws_ami
  instance_type = var.aws_instance_jenkins
  key_name      = var.key_name
  user_data     = file("jenkins.sh")
  vpc_security_group_ids = aws_security_group.jenkins_server_sg.id
  
  tags = {
    "Name" = "${var.environment}-jenkins-instance"
  }
}
