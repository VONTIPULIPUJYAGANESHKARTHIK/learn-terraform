resource "aws_instance" "roboshop" {
    count = 10
    instance_type = var.instance_type
    ami = "ami-0055977a6e828a4f4"
    vpc_security_group_ids = [
        aws_security_group.common.id,
        aws_security_group.croboshop[count.index].id,
    ]

  tags = {
    Name = "${var.project}-${var.environment}-${var.instance[count.index]}"
  }
} 
resource "aws_security_group" "common" {
    count = 10
    name        = "${var.project}-${var.environment}-${var.instance[count.index]}"
    description = "A common SG for all the instances"
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instance[count.index]}"
  }
}