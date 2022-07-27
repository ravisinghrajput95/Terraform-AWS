variable "instance_keypair" {
  description = "Key pair to be used for the ec2 instance"
  type        = string
  default     = "shell"
}

variable "region" {
  description = "region where the ec2 instance will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS Credentials Profile configured on local"
  type        = string
  default     = "default"

}

variable "instance_type" {
  description = "instance family to be considered when provisioning"
  type        = map(string)
  default = {
    "dev"   = "t2.micro"
    "qa"    = "t3.medium"
    "scale" = ""
    "prod"  = ""
  }
}