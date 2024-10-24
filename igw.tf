resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(var.tags, { Name = "${var.name}-igw" })
}
