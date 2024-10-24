resource "aws_eip" "nat_eip" {
  vpc = true

  tags = merge(var.tags, { Name = "${var.name}-nat-eip" })
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(var.tags, { Name = "${var.name}-nat-gateway" })

  depends_on = [aws_internet_gateway.internet_gateway]
}
