data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-ebs"]
  }
}
