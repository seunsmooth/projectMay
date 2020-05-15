resource "aws_security_group" "nginx_allow-dev" {
  name        = "allow-ssh-dev"
  vpc_id      = module.vpc-dev.vpc_id
  description = "nginx security group "
  tags = {
    Name = "nginx SG"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tomcat_allow-prod" {
  name        = "tomcat_allow"
  vpc_id      = module.vpc-prod.vpc_id
  description = "tomcat security group "
  tags = {
    Name = "tomcat SG"
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-prod" {
  name        = "allow-ssh-prod"
  vpc_id      = module.vpc-prod.vpc_id
  description = "security group allow ssh "

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [element(var.white_listed_entrants, 0), element(var.white_listed_entrants, 1)]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
