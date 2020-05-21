terraform {
  backend "s3" {
    bucket = "terraform-state-gznaklq9"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}