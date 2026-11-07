resource "aws_instance" "web" {
    count = 3
    instance_type = "t3.micro"
    ami = "ami-0055977a6e828a4f4"
    vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "roboshop-web"
  }
} 
resource "aws_security_group" "common" {
  name        = "roboshop-common"
  description = "A common SG for all the instances"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-web"
  }
}