resource "aws_instance" "this" {
  for_each = { for idx, subnet in var.subnet_ids : idx => subnet }

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = each.value
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Hello from EC2 - ${var.name}-${each.key}</h1>" > /var/www/html/index.html
              EOF

  tags = merge(var.tags, {
    Name = "${var.name}-${each.key}"
  })
}

resource "aws_lb_target_group_attachment" "attach" {
  for_each = aws_instance.this

  target_group_arn = var.target_group_arn
  target_id        = each.value.id
  port             = 80
}
