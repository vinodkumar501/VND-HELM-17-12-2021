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
  access_key = "AKIAUMHZDA7YwertyeeXQ3U7JXB"                              #not recommended to store credentials like static 
  secret_key = "G5lFp8FpzqjwertyrewRBYF7NhM/ccArSdiIzavTa6j7nGrY"
}
