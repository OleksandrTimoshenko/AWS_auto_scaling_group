output "sg" {
  value       = aws_security_group.allow_http.id
}
 output "vps_id" {
   value      = aws_vpc.my_vpc.id
 }

 output "subnet_1a" {
   value      = aws_subnet.public_us_east_1a.id
 }

  output "subnet_1b" {
   value      = aws_subnet.public_us_east_1b.id
 }