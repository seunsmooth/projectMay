
module "vpc-dev" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-dev"
  cidr   = "10.1.0.0/16"

  azs             =  ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6          = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  #enable_nat_gateway   = true
  #enable_vpn_gateway   = false


  tags = {
    Name        = "${var.stack}-vpc-dev"
    Terraform   = "true"
    Environment = "dev"
  }

}

module "vpc-prod" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-prod"
  cidr   = "10.1.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6          = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  #enable_nat_gateway   = true
  #enable_vpn_gateway   = false

  tags = {
    Name        = "${var.stack}-vpc-prod"
    Terraform   = "true"
    Environment = "prod"
  }

}