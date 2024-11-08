variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}

variable "name" {
  description = "Name of EC2 Intance"
  type        = string
}

variable "ami_name" {
  description = "name of Amazon Machine Image (AMI)"
  type        = string
}