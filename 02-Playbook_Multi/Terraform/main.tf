resource "aws_security_group" "solr-SG1" {

  name = "apache_solr"
  ingress {
    description = "SSH Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    description = "Solr Default Port"
    from_port   = 8983
    to_port     = 8983
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0

  }

}

resource "aws_instance" "Solr" {
  ami = "ami-0932440befd74cdba"
  tags = {
    Name      = "Apache-Solr"
    CeratedBy = "Terraform"
    UsedBy    = "Ansible"
  }
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.solr-SG1.name]
  key_name = "pub"
}
