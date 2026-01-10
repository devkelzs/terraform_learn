resource "aws_launch_template" "this" {
  name_prefix   = "web-lt-"
  image_id      = var.ami
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.instance_sg_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.name
    }
  }
}
