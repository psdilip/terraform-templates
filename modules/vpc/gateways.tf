resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_gw.eip.id
    subnet_id = aws_subnet.public_subnet[0].id
    depends_on = [aws_internet_gateway.igw]

    tags = merge(
        var.tags,
        {
            Name = "${var.vpc_tags}-nat-gateway"
        }
    )
}