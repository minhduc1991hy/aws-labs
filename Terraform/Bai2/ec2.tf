resource "aws_instance" "web" {
  ami             = "ami-0f62d9254ca98e1aa"
  instance_type   = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.s3_rds_profile.name
  key_name        = "${var.stage}-${var.keyname}"
  security_groups = ["site_golang"]
  user_data       = file("script.sh")
  tags = {
    Name = "aws02"
  }

  provisioner "file" {
    source      = "./uploads3"
    destination = "/home/ec2-user"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.stage}-${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}