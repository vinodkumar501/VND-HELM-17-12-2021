resource "aws_instance" "myfirstserver" {                       #"<provider>_<resourcetype>" "<anyname)"
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"

  tags = {
    Name = "vnd-amazon linux instance"
  }
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

#Here terraform it checks all .tf files in the directory 
#so we can add any no of .tf files it execute all 
#main.tf only provider and credentials you have to store as a standard perspective 
#we can include all in only main.tf file but its not feasible or difficult to update or debug the issue
