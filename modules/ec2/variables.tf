variable "instance_type" {
  description = "insatnce type"
}
variable "ami" {
  description = "Aim for ec2 instances"
  default = "ami-0ecb62995f68bb549"
  type        = string
}
variable "name" {
  description = "instance name"
  type = string
}
variable "subnet_id" {
    description = "Subnet ID for EC2"
    type        = string
}
variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}
