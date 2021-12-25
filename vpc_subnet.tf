#CREATE 2 VPC'S AND CREATE 2 SUBNETS ATTACHED TO IT
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "prod-vnd" {
  cidr_block = "172.32.0.0/16"
   tags = {
    Name = "production-vpc"
  }
}

resource "aws_vpc" "dev-vnd" {
  cidr_block = "172.33.0.0/16"
   tags = {
    Name = "Developer-vpc"
  }
}

#subnet creation
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "prod-subnet" {
  vpc_id     = aws_vpc.prod-vnd.id
  cidr_block = "172.32.1.0/24"

  tags = {
    Name = "production-subnet"
  }
}

resource "aws_subnet" "dev-subnet" {
  vpc_id     = aws_vpc.dev-vnd.id
  cidr_block = "172.33.1.0/24"

  tags = {
    Name = "developer-subnet"
  }
}



#note:
#order in which you place code is doesnot matter in terraform
#you can specify anywhere like subnet needs vpc 
#no need to add first vpc and subnet just mention in .tf file irrespective of order terraform will do the process 
