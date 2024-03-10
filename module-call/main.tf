locals {
    customer = ""
    environment = ""
}

module "firewall-vpc" {

    source = "../modules/vpc"

    vpc_cidr = "192.168.0.0/16"
    azs = ["us-east-1a", "us-east-1b"]

    database_subnet_enabled = false
    database_subnet_cidr = [""]

    public_subnet_cidr = ["192.168.1.0/24", "192.168.2.0/24"]
    private_subnet_cidr = ["192.168.3.0/24", "192.168.4.0/24"]

    firewall_subnet_cidr = ["192.168.5.0/24", "192.168.6.0/24"]

    rt_cidr_block = "0.0.0.0/0"

    vpc_tags = join("-", [local.customer, local.environment, "firewall-vpc"])
}