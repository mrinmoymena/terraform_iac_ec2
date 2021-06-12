variable "region" {
  default = "ap-south-1"
  type    = string
}

variable "shared_credentials_file" {
  default = "/.aws/credentials"
  type    = string
}

variable "profile" {
  default = "default"
  type    = string
}

variable "key_pair" {
  #default   = "ec2ubuntu"
  description= "Create key pair for EC2 in aws and provide the name\n" 
  type       = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ami" {
  default = "ami-0c1a7f89451184c8b"
  type    = string
}

