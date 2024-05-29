output "server_public_ip" {
  value = "http://${aws_instance.api_nodejs.public_ip}"
}
