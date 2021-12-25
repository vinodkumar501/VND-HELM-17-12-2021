resource "aws_instance" "myfirstserver" {                       #"<provider>_<resourcetype>" "<anyname>"
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"

  tags = {
    Name = "vnd-amazon linux instance"
  }
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

#./terraform plan
#./terraform apply        --> It apply all .tf files in directory

# Once apply is done it create a new file called "terraform.tfstate" file "terraform.tfstate.backup"

#terraform.tfstate:

#Stores all state data we created using .tf files once we apply whatever we created it store the state data in "terraform.tfstate" file
#once we delete resource like "terraform destroy" it removes from state date from "terraform.tfstate"

#terraform.tfstate.backup:
#File consists of data of "terraform.tfstate" but once we destroy it erase data from "terraform.tfstate" but "terraform.tfstate.backup" still will have state data even
#we delete resources.


#./terraform destroy      --> destroy all .tf files data 


#Here terraform it checks all .tf files in the directory 
#so we can add any no of .tf files it execute all 
#main.tf only provider and credentials you have to store as a standard perspective 
#we can include all in only main.tf file but its not feasible or difficult to update or debug the issue
