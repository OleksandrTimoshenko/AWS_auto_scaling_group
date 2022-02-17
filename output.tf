output "elb_domain" {
  description = "New domain name of ELB server"
  value       = module.lb.elb_dns_name
}

output "route53_domain" {
    description = "Route53 domain."
    value       = module.route53.route
}