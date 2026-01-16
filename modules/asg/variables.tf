variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "user_data" {
  type = string
}

variable "name" {
  type = string
}
variable "instance_profile" {
  description = "IAM instance profile name for EC2 instances"
  type        = string
}


