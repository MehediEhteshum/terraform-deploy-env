resource "aws_vpc" "vpc1" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    environment = var.environment
  }
}

resource "aws_subnet" "snet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.location}a"

  tags = {
    environment = var.environment
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    environment = var.environment
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    environment = var.environment
  }
}

resource "aws_route" "rtr1" {
  route_table_id         = aws_route_table.rt1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw1.id
}

resource "aws_route_table_association" "snet1-rt1" {
  subnet_id      = aws_subnet.snet1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_security_group" "sg1" {
  name        = "public-sg1"
  description = "public security group"
  vpc_id      = aws_vpc.vpc1.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key-auth1" {
  key_name   = "key-rsa1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "vm1" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.vm1-ami.id
  key_name               = aws_key_pair.key-auth1.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
  subnet_id              = aws_subnet.snet1.id
  user_data              = file("customdata.tpl")

  root_block_device {
    volume_size = 10
  }

  # usage of provisioner is a last resort or
  # can be used for simple non-destructive tasks
  # not recommended for complex operations
  # provisioner changes are not captured in terraform state
  provisioner "local-exec" {
    command = templatefile("${var.local-os}-ssh-script.tpl", {
      hostname     = self.public_ip_address,
      user         = "ubuntu",
      identityfile = "~/.ssh/id_rsa"
    })
    interpreter = var.local-os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }

  tags = {
    environment = var.environment
  }
}
