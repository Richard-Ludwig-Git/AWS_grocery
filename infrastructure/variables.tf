variable "aws_region" {
  type = string
  default = "eu-central-1"
  description = "EC2 region"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "EC2 Instance Type"
}

