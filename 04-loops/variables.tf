variable "environment" {
  default = "dev"
}

variable "project" {
  default = "roboshop"
}

variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "AMI ID to be used for the instances"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for the instances"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Instance type should be t3.micro, t3.small, or t3.medium."
  }
}

variable "instances" {
  type = list(string)

  default = [
    "mongodb",
    "redis",
    "rabbitmq",
    "catalogue",
    "user",
    "shipping",
    "payment",
    "frontend",
    "dispatch",
    "cart",
    "mysql"
  ]
}