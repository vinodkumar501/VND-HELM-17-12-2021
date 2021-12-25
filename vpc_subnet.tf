#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "testing-vnd" {
  cidr_block = "172.32.0.0/16"
   tags = {
    Name = "testing-vnd"
  }
}

#subnet creation
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "testing-subnet" {
  vpc_id     = aws_vpc.testing-vnd.id
  cidr_block = "172.32.1.0/24"

  tags = {
    Name = "testing-subnet"
  }
}
