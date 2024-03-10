## Public Subnet
resource "aws_subnet" "public_subnet" {
    for_each = { for id, az in var.azs : id => az }
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr[each.key]
    availability_zone = each.value

    tags = merge(
        var.tags,
        {
            Name = "${var.vpc_tags}-public-subnet-${each.key + 1}"
        }
    )
}

## Private Subnet
resource "aws_subnet" "private_subnet" {
    for_each = { for id, az in var.azs : id => az }
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnet_cidr[each.key]
    availability_zone = each.value

    tags = merge(
        var.tags,
        {
            Name = "${var.vpc_tags}-private-subnet-${each.key + 1}"
        }
    )
}

## Database Subnet
# resource "aws_subnet" "database_subnet" {
#     for_each = { for id, az in var.azs : id => az if var.database_subnet_enabled}
#     vpc_id = aws_vpc.vpc.id
#     cidr_block = var.database_subnet_cidr[each.key]
#     availability_zone = each.value

#     tags = merge(
#         var.tags,
#         {
#             Name = "${var.vpc_tags}-database-subnet-${each.key + 1}"
#         }
#     )
# }

## Firewall Subnet
# resource "aws_subnet" "firewall_subnet" {
#     for_each = { for id, az in var.azs : id => az if var.firewall_subnet_enabled}
#     vpc_id = aws_vpc.vpc.id
#     cidr_block = var.firewall_subnet_cidr[each.key]
#     availability_zone = each.value

#     tags = merge(
#         var.tags,
#         {
#             Name = "${var.vpc_tags}-firewall-subnet-${each.key + 1}"
#         }
#     )
# }




