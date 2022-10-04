resource "aws_instance" "web" {
  ami             = "ami-0f62d9254ca98e1aa"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = ["site_ssh"]
  user_data = file("script.sh")
  tags = {
    Name = "nginxphp"
  }

  //Copy folder travel vào thư mục /home/ec2-user/
  provisioner "file" {
    source      = "./html"
    destination = "/home/ec2-user"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
  provisioner "file" {
    source      = "./nginx/sites.conf"
    destination = "/home/ec2-user/sites.conf"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}