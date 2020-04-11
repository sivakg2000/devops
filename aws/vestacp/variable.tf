variable "awsprops" {
  type = "map"
  default = {
    region       = "us-east-1"
    vpc          = "vpc-5234832d"
    ami          = "ami-0c1bea58988a989155"
    itype        = "t2.micro"
    subnet       = "subnet-81896c8e"
    publicip     = true
    keyname      = "myseckey"
    secgroupname = "vestcp-Sec-Group"
  }
}

provider "aws" {
  region = lookup(var.awsprops, "region")
}



#AWS key pair Name
variable "KeyPair" {
  description = "Desired name of AWS key pair"
  default     = "KeyPair"
}
#SSH PEM file
variable "KeyPair_PEM" {
  description = "SSH PEM file "
  default     = "KeyPair.pem"
}
