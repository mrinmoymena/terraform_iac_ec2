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

