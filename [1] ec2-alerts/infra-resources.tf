# SG to allow SSH connect to EC2

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# simple EC2
resource "aws_instance" "WebServer" {
  ami                    = "ami-06b21ccaeff8cd686"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "WebServer"
  }
  monitoring = true
}

resource "aws_instance" "WebServer-1" {
  ami                    = "ami-06b21ccaeff8cd686"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "WebServer-1"
  }
  monitoring = true
}

