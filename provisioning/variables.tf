variable "account" {
  default = "default"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "key_name" {
    description = "Key pair to access instances"
    default = "mykeypair"
}

variable "availability_zone_a"{
	default = "us-west-1a"
}

variable "availability_zone_c"{
	default = "us-west-1c"
}

variable "db_pass" {
	default = "REDACTED"
}