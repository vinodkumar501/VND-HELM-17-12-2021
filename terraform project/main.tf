#create VPC,
#create IGW,
#create CUSTOM ROUTE TABLE
#create SUBNET
#associate SUBNET WITH ROUTE TABLE
#create A SECURITY GROUP TO ALLOW PORT 80,22,443
#create A NETWORK INTERFACE with an IP in the subnet that was created in step4
#assign A ELASTIC IP to the network interface created in step7
#create a UBUNTU SERVER and install/enable apache


#1.create vpc

resource "aws_vpc" "dev-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-dev"
  }
}

#2.create IGW
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-IGW"
  }
}

#3,create route table
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}

#create subnet
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "dev-subnet" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-dev"
  }
}

#associate subnet with route table
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "dev-rt-assoc" {
  subnet_id      = aws_subnet.dev-subnet.id
  route_table_id = aws_route_table.dev-rt.id
}

#create security group
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.dev-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dev-vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.dev-vpc.ipv6_cidr_block]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dev-vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.dev-vpc.ipv6_cidr_block]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dev-vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.dev-vpc.ipv6_cidr_block]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}

#create NETWORK INTERFACE
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface

resource "aws_network_interface" "network_interface" {
  subnet_id       = aws_subnet.dev-subnet.id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.allow_tls.id]

  attachment {
    instance     = aws_instance.dev.id
    device_index = 1
  }
}

#CREATE ELASTIC IP
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "lb" {
  instance = aws_instance.dev.id
  vpc      = true
}

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.network_interface.id
  associate_with_private_ip = "10.0.0.10"
}

#create an Instance
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "dev" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "awslearning"
  security_groups = ""
  tags = {
    Name = "dev1-appn"
  }
}
