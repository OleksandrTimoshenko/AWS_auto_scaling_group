variable "aws_access_key" {
  description = "Access key to your AWS account "
}

variable "aws_secret_key" {
  description = "Secret key to your AWS account "
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}