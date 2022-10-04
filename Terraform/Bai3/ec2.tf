resource "aws_instance" "web" {
  ami             = "ami-0f62d9254ca98e1aa"
  instance_type   = "t2.micro"
  key_name        = "${var.stage}-${var.keyname}"
  security_groups = ["site_ssh"]
  user_data       = file("script.sh")
  tags = {
    Name = "aws03"
  }
}
