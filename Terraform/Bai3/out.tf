output "ssh_command" {
  value = "ssh -i '${var.stage}-${var.keyname}.pem' ec2-user@${module.alb.lb_dns_name}"
}

output "web_site" {
  value = "http://${module.alb.lb_dns_name}"
}
