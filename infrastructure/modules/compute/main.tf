data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  iam_instance_profile   = var.instance_profile_name
  vpc_security_group_ids = [var.security_group_id]

  user_data = file("${path.module}/user_data.sh")

  root_block_device {
    volume_size = 30
    encrypted   = true
  }

  tags = {
    Name = "${var.project_name}-jenkins"
  }
}
