resource "aws_instance" "myfirstserver" {                       #"<provider>_<resourcetype>" "<anyname>"
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"

  tags = {
    Name = "vnd-amazon linux instance"
  }
}
