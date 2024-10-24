resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(var.tags, { Name = "${var.name}-vpc" })
}
