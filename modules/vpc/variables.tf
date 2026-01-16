variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string

}
variable "public_subnet_cidr_1" {
  description = "The CIDR block for the VPC's public subnet"
  type        = string
}
variable "public_subnet_cidr_2" {
  description = "The CIDR block for the VPC's second public subnet"
  type        = string
  
}


variable "private_subnet_cidr" {
  description = "The CIDR block for the VPC's private subnet"
  type        = string
}
variable "az_1" {
  description = "The first availability zone"
  type        = string
}
variable "az_2" {
  description = "The second availability zone"
  type        = string
}