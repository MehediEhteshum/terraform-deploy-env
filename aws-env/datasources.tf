data "aws_ami" "vm1-ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "aws_instance" "vm1-data" {
  instance_id = aws_instance.vm1.id
}
