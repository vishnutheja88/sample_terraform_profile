resource "aws_instance" "jenkins_instance" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_jenkins
  key_name      = var.key_name
  user_data     = file("jenkins.sh")
  vpc_security_group_ids = aws_security_group.jenkins_server_sg.id
  
  tags = {
    "Name" = "${var.environment}-jenkins-instance"
  }
}
