
variable  "instance_type" {
  type        = string
}

variavle "environment" {
  type = string
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-workspaces-demo"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}