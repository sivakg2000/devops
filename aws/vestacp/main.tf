

#Generate RSA Private Key
resource "tls_private_key" "=PRI_KEY" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


#Key Pair to Access To EC2 Instance
resource "aws_key_pair" "KeyPair" {
  key_name   = "${var.KeyPair}"
  public_key = "${tls_private_key.PRI_KEY.public_key_openssh}"

}


#Local pem file to Access To EC2 Instance
resource "local_file" "KeyPair_PEM" {
  content = "${tls_private_key.PRI_KEY.private_key_pem}"
  filename = "${var.eyPair_PEM
  }"

}
resource "aws_instance" "project-iac" {
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "itype")
  subnet_id                   = lookup(var.awsprops, "subnet")
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = "${aws_key_pair.KeyPair.id}"
  user_data                   = "${file("userdata.sh")}"


  vpc_security_group_ids = [
    aws_security_group.vestacp.id
  ]
  root_block_device {
    delete_on_termination = true
    iops                  = 150
    volume_size           = 50
    volume_type           = "gp2"
  }
  tags = {
    Name        = "Vesta CP"
    Environment = "DEV"
  }

  depends_on = [aws_security_group.vestacp]
}


