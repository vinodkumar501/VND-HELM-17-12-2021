terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "fghifdkjhfhjkfghghjkghjkgbbghj"                              #not recommended to store credentials like static 
  secret_key = "sdfghjklkjhgfdfghjkl;dfghjklfghjkasdfghjl"
}


#terraform init
#terraform plan 
#terraform apply 

#$ ./terraform init

#Initializing the backend...

   
#Once intialise is done it stores .files (hidden) files like .terraform/  .terraform.lock.hcl  in the same directory
  
#$ ls -a
#./  ../  .terraform/  .terraform.lock.hcl  main.tf  terraform.exe*

#.terraform stores provider details  
#/c/Users/vinod.chenna/Desktop/Terraform/.terraform/providers/registry.terraform.io/hashicorp/aws/3.70.0/windows_amd64
   
#and it lock the state of provider version at 
#cat .terraform.lock.hcl
  
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

#provider "registry.terraform.io/hashicorp/aws" {
#  version     = "3.70.0"
#  constraints = "~> 3.0"
#  hashes = [
#    "h1:nUJfymSecxxYgW+Vc3tqv9Ymlqc91ZeGk5t4vnRaC3c=",
#    "zh:0af710e528e21b930899f0ac295b0ceef8ad7b623dd8f38e92c8ec4bc7af0321"
#  ]
#}

  
  
  
  
  
  
  
  
  
  
  

  
