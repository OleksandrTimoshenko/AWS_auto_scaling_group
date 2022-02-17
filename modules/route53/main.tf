resource "aws_route53_zone" "aws_zone" {
    name = "feature-testing.link"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.aws_zone.id
  name    = "aws_test.feature-testing.link"
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 10
  }

  set_identifier = "dev"
  records        = [ var.elb_domain ]
}
