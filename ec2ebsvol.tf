resource "aws_volume_attachment" "vol_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.webserver.id
  instance_id = aws_instance.webserver.id
}

resource "aws_instance" "webserver" {
  ami               = "ami-0b28dfc7adc325ef4"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"
  key_name = "Linux-Demo-Oregon"

  tags = {
    Name = "WebTest"
    env = "prod"
  }
}

resource "aws_ebs_volume" "webserver" {
  availability_zone = "us-west-2a"
  size              = 2

  tags = {
    Name = "WebVol"
      }
}