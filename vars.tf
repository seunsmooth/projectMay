#variable "ami_id" {
# default = "ami-0f2ed58082cb08a4d"
#}
variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "olukey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/play/tutorial/weather/olukey"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "private_subnets" {
  default = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "public_subnets" {
  default = ["10.1.10.0/24", "10.1.20.0/24"]
}

variable "subnet_id" {
  default = "subnet-0ffbe71882deab7b5"
}

variable "white_listed_entrants" {
  default = ["87.80.20.214/32", "0.0.0.0/0"]
}

variable "stack" {
  description = "Name of the Stack"
  default     = "terraform"
}

variable "ENV" {
  default = "dev"

}

