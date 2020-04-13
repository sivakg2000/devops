variable "awsprops" {
  type = "map"
  default = {
    region       = "us-east-1"
    vpc          = "vpc-5234832d"
    ami          = "ami-0c1bea58988a989155"
    itype        = "t2.micro"
    secgroupname = "vestcp-Sec-Group"
  }
}

provider "aws" {
  region = "us-east-1"
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
