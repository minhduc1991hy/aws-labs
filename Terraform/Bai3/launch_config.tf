resource "aws_launch_configuration" "aws03_alc" {
  name_prefix     = "aws03-"
  image_id        = "ami-0f62d9254ca98e1aa"
  instance_type   = "t2.micro"
  key_name        = "${var.stage}-${var.keyname}"
  user_data       = file("script.sh")
  security_groups = [aws_security_group.site_asg.id]

  lifecycle {
    create_before_destroy = true
  }
}
