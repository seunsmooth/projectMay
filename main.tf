resource "aws_key_pair" "olukey-id" {
  key_name   = "olukey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "proxy_server" {
  instance_type          = "t2.micro"
  ami                    = var.AMI_ID_NGINX
  subnet_id              = module.vpc-prod.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.sg-prod.id]
  #subnet_id                   = var.ENV == "dev" ? module.vpc-dev.public_subnets[0] : module.vpc-prod.public_subnets[0]
  #vpc_security_group_ids      = [var.ENV == "dev" ? aws_security_group.sg-dev.id : aws_security_group.sg-prod.id]
  key_name = "olukey"
  tags = {
    Name = "proxy_server-${var.stack}"
  }

  provisioner "local-exec" {
    command = "echo 'proxy_server is ' ${aws_instance.proxy_server.private_ip} >> private_ips.txt"
  }
  lifecycle {
    create_before_destroy = true
  }
}

output "ip" {
  value = "https://${aws_instance.proxy_server.public_ip}:80 To connect ssh -i ../../weather/olukey ubuntu@${aws_instance.proxy_server.public_ip}"
}


resource "aws_instance" "bluebox" {
  instance_type          = "t2.micro"
  ami                    = var.AMI_ID_WEB
  subnet_id              = module.vpc-prod.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.sg-prod.id]
  key_name               = "olukey"

  tags = {
    Name = "bluebox-${var.stack}"
  }

  provisioner "local-exec" {
    command = "echo 'redbox private'${aws_instance.redbox.private_ip} >> private_ips.txt"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "redbox" {
  instance_type          = "t2.micro"
  ami                    = var.AMI_ID_WEB
  subnet_id              = module.vpc-prod.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.sg-prod.id]
  key_name               = "olukey"
  tags = {
    Name = "redbox-${var.stack}"
  }

  provisioner "local-exec" {
    command = "echo 'redbox private'${aws_instance.redbox.private_ip} >> private_ips.txt"
  }
  lifecycle {
    create_before_destroy = true
  }
}
output "proxy_server_ip" {
  value = "http://${aws_instance.proxy_server.public_ip} To connect ssh -i olukey ubuntu@${aws_instance.proxy_server.public_ip}"
}
