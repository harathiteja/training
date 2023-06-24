provider "aws" {
  region = "eu-west-1"

}
resource "aws_instance" "web" {
  ami = "ami-09dd5f12915cfb387"
  instance_type = "t2.micro"
  vpc_security_group_ids  = ["sg-080fa4554765c7621"]
  key_name = "demo"

   tags = {
    Name = "First"
  }
}

resource "aws_security_group" "TF_tls" {
  name        = "TF_tls"
  description = "Allow TF inbound traffic"
  vpc_id      = "vpc-026357b991854077f"

  ingress {
    description      = "HTTP"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_tls"
  }
}
