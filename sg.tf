resource "aws_security_group" "jenkins_server_sg" {
  description = "jenkins server security group"
  name        = "jenkins_security_group"
  ingress {
    description = "jenkins ingress"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  ingress {
    description     = "ssh from bastion"
    from_port       = 22
    to_port         = 22
    security_groups = [var.aws_instance_jenkins]
    protocol        = "tcp"
  }
  egress {
    description = "outbound port"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    "Name" = "${var.environment}-jenkins-sg"
  }

}
