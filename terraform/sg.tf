resource "aws_security_group" "flask" {
  name        = "${local.name}-allow-ssh"
  description = "Allow Jenkins inbound traffic"
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.source_ip]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.source_ip]
    ipv6_cidr_blocks = ["::/0"]
  }
}