# Titan Network Module - NAT Gateway Resources

# NAT Gateways per Availability Zone
resource aws_nat_gateway default {
  count = var.nat_enabled ? var.subnets_per_layer : 0

  allocation_id = aws_eip.nat[count.index].id
  subnet_id = module.dmz_layer.subnet_ids[count.index]

  tags = {
    Name = "nat-${count.index}.${var.name_short}.${var.domain}"
    titan_layer = "dmz"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Elastic IP Allocation per NAT Gateway
resource aws_eip nat {
  count = var.nat_enabled ? var.subnets_per_layer : 0

  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}
