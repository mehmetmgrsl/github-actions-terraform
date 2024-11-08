terraform {
  backend "s3" {
    bucket         = "s310312024-001"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }
  required_version = ">= 1.0" 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "example" {
  ami           = var.ami_name
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y update
              sudo yum -y install httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF

  lifecycle {
    create_before_destroy = true
  }
}