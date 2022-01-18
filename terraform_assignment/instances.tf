resource "aws_instance" "instance1" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data              = file("data.sh")

  tags = {
    "Name" = "instance-1"
  }
}

resource "aws_instance" "instance2" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data              = file("data.sh")

  tags = {
    "Name" = "instance-2"
  }
}