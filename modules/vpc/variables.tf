variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string

}
variable "public_subnet_cidr" {
  description = "The CIDR block for the VPC's public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the VPC's private subnet"
  type        = string
}