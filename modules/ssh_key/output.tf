output "ssh_keypair" {
  value = tls_private_key.key.private_key_pem
}


output "key" {
  value = aws_key_pair.key_pair.key_name
}