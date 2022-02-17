module "vpc" {
    source = "./modules/vpc"
}

module "ssh_key" {
  source    = "./modules/ssh_key"
}

module "ec2" {
    source = "./modules/ec2"
    sg = module.vpc.sg
    key = module.ssh_key.key
}

module "lb" {
  source    = "./modules/lb"
  sg = module.vpc.sg
  vpc_id = module.vpc.vps_id
  subnet_1a = module.vpc.subnet_1a
  subnet_1b = module.vpc.subnet_1b
}

module "ag" {
  source = "./modules/ag"
  elb = module.lb.elb
  launch_configuration = module.ec2.launch_configuration
  subnet_1a = module.vpc.subnet_1a
  subnet_1b = module.vpc.subnet_1b  
}

module "route53" {
  source = "./modules/route53"
  elb_domain = module.lb.elb_dns_name
}