data "aws_ami" "ami-test1" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = var.value
  }
}

resource "aws_instance" "hemant" {
  ami           = data.aws_ami.ami-test1.id
  instance_type = var.machinetype
  key_name      = "devjenkins"

  tags = {
    Name = "HelloWorld"
  }
}