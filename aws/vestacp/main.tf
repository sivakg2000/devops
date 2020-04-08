resource "aws_instance" "vestacp" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Vesta CP"
  }
}
