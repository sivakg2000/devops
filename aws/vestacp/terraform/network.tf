resource "aws_security_group" "vestacp" {
  name        = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id      = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 (HTTP) Transport
  ingress {
    from_port   = 80
    protocol    = ""
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 443 (HTTPS) Transport
  ingress {
    from_port   = 443
    protocol    = ""
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 8083 (VESTCP)Transport
  ingress {
    from_port   = 8083
    protocol    = ""
    to_port     = 8083
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 25 (SMTP) Transport
  ingress {
    from_port   = 25
    protocol    = ""
    to_port     = 25
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
