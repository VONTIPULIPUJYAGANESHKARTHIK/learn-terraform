variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"
}

varaibale "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "AMI id to be used for the instances"
}

varaibale "instance_type" {
    type = string
    default = "t3.micro"
    description = "Instance type for the instances"
}

validation {
    condition = contains(["t3.micro", "t3.small","t3.medium"], var.instance_type)
    error_message = "Instance type should be t3.micro or t3.small"
}

variable "instance" {
    type = list
    default = ["mongodb", "redis", "rabbitmq", "catalouge", "user", "shipping", "payment", "frontend", "dispatch", "cart", "mysql"]
}