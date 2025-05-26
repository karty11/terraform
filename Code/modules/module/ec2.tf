resource "aws_instance" "webserver" {
  ami           = var.amiid
  instance_type = var.machinetype
  key_name = var.keyname
  subnet_id = var.subnet_id
  tags = {
    Name =var.mytag
  }
}