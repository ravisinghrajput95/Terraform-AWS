resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.webserver_ami.id
  instance_type          = var.instance_type["dev"]
  user_data              = file("${path.module}/install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  for_each               = toset(data.aws_availability_zones.webserver_azs.names)
  availability_zone      = each.key
  tags = {
    "Name" = "webserver-${each.value}"
  }
}