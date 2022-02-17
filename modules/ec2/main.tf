data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "web" {
  name_prefix   = "web-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = var.key

  security_groups = [ var.sg ]
  associate_public_ip_address = true

  user_data = "${file("install_apache.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}
