resource "aws_autoscaling_group" "web" {
  name = "${var.launch_configuration}-asg"

  min_size             = 1
  desired_capacity     = 1
  max_size             = 4
  
  health_check_type    = "ELB"
  load_balancers = [
    var.elb
  ]

  launch_configuration = var.launch_configuration

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier  = [
    var.subnet_1a,
    var.subnet_1b
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

}