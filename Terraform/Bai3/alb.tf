module "alb" {
  source                        = "terraform-aws-modules/alb/aws"
  alb_name                      = "my-alb"
  alb_protocols                 = ["HTTPS"]
  alb_security_groups           = ["sg-edcd9784", "sg-edcd9785"]
  certificate_arn               = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  create_log_bucket             = true
  enable_logging                = true
  health_check_path             = "/"
  log_bucket_name               = "logs-us-east-2-123456789012"
  log_location_prefix           = "my-alb-logs"
  subnets                       = ["subnet-abcde012", "subnet-bcde012a"]
  tags                          = "${map("Environment", "test")}"
  vpc_id                        = "vpc-abcde012"
}