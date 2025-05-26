resource "aws_instance" "web" {
  ami           = "ami-08df2a3a987c7b9fc"
  instance_type = "t2.micro"
  key_name = "Venuskey"
  vpc_security_group_ids = ["sg-0ec5f5aeb8746388e"]
  subnet_id = "subnet-07c389f635ba5ac88"
  tags = {
    Name="webserver"
    Env="dev"
  }
}
resource "aws_ebs_volume" "extra_ebs" {
  availability_zone = aws_instance.web.availability_zone
  size              = "1"
  type              = "gp3"
  tags              = {
    Name = "extra_ebs_volume"
  }
}
resource "aws_volume_attachment" "ebs_extra_vol_attach" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.web.id
  volume_id   = aws_ebs_volume.extra_ebs.id
  depends_on = [aws_instance.web, aws_ebs_volume.extra_ebs]
}