variable "aws_region" {
  description = "AWS region"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for remote state"
}

variable "name" {
  description = "Name of EC2 Intance"
}

variable "ami_name" {
  description = "ID of AMI"
}