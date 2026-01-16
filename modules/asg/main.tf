resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt-"
  image_id      = var.ami
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)
    iam_instance_profile {
    name = var.instance_profile
  }

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

resource "aws_autoscaling_group" "asg" {
  name                = var.name
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3

  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300
}
