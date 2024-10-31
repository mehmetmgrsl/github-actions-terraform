terraform {
  backend "s3" {
    bucket         = "s310312024-001"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
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