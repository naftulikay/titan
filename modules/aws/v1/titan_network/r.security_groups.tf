# Titan Network Module - Security Group Resources

# Default Security Group for the VPC
# Allow SSH Internal Ingress; Egress Anywhere
resource aws_default_security_group default {
  vpc_id = aws_vpc.default.id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = [aws_vpc.default.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.default.ipv6_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "titan_${var.name_short}_default"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

# Security Group Allowing Network-Internal SSH Access
resource aws_security_group ssh {
  name = "titan_${var.name_short}_ssh_internal"
  description = "Network-Internal SSH Access in the ${var.name_fancy}."
  vpc_id = aws_vpc.default.id

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [aws_vpc.default.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.default.ipv6_cidr_block]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "titan_${var.name_short}_ssh_internal"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}
