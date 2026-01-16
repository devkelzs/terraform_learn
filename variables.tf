# AWS provider
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# VPC configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

# EC2 configuration
variable "ami" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
# Availability Zones
variable "az_1" {
  description = "The first availability zone"
  type        = string
}
variable "az_2" {
  description = "The second availability zone"
  type        = string
}
variable "public_subnet_cidr_1" {}
variable "public_subnet_cidr_2" {}

