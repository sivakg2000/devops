output "public_ip" {
  value = "${aws_instance.project-vestacp.public_ip}"
}
