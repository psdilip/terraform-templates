#VPC
variable "vpc_cidr" {
    type = string
    description = "cidr block for vpc"
}

variable "vpc_tags" {
    type = string
    description = "tags for vpc"
}

#Subnets
variable "azs" {
    type = list(string)
    description = ""
}

variable "public_subnet_cidr" {
    type = list(string)
    description = ""
}

variable "private_subnet_cidr" {
    type = list(string)
    description = ""
}

# variable "database_subnet_enabled" {
#     type = bool
#     description = ""
# }

# variable "firewall_subnet_enabled" {
#     type = bool
#     description = ""
# }

# variable "database_subnet_cidr" {
#     type = list(string)
#     description = ""
# }

# variable "firewall_subnet_cidr" {
#     type = list(string)
#     description = ""
# }

variable "rt_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "tags" {
    type = map
    default = {
        "business-owner" : "",
        "technical-owner" : "",
        "cost-center": "",
        "department": "",
        "division": "",
        "customer": "",
        "data-classification": "",
        "business-criticality": "",
        "project" : "",
        "terraform" : ""
    }
}