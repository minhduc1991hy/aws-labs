resource "aws_autoscaling_group" "web" {
  name             = "${var.project}-asg"
  min_size         = 1
  max_size         = 3
  desired_capacity = 2

  launch_configuration = aws_launch_configuration.aws03_alc.name
  vpc_zone_identifier  = module.vpc.public_subnets
  target_group_arns    = module.alb.target_group_arns

  tag {
    key                 = "Name"
    value               = "HashiCorp Learn ASG"
    propagate_at_launch = true
  }

  # launch_template {
  #   id      = aws_launch_template.aws03_alt.id
  #   version = aws_launch_template.aws03_alt.latest_version
  # }
}

module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "~> 6.0"
  name               = var.project
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.site_asg_lb.id]
  http_tcp_listeners = [
    {
      port               = 80,
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
  target_groups = [
    {
      name_prefix      = "web",
      backend_protocol = "HTTP",
      backend_port     = 80
      target_type      = "instance"
    }
  ]
}
