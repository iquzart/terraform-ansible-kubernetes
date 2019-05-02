variable "aws_access_key" {
  description = "AWS Access Key"
  default = ""
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  default = ""
}

variable "aws_region" {
  description = "AWS Region the instance is launched in"
  default = "eu-west-1"
}

variable "ami" {
  description = "The AMI to use for the instance. (default - Ubunut 18.04)" 
  default     = "ami-08d658f84a6d84a80" 

}

variable "ssh_key_pair" {
  description = "SSH key pair to be provisioned on the instance"
  default     = "ssh_me"
}

variable "ssh_user" {
  description = "SSH User on Instance"
  default = "ubuntu"
}

variable "instance_type" {
  description = "The type of the instance"
  default     = "t2.micro"
}

