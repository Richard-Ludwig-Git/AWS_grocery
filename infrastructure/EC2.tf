resource "aws_instance" "EC2-viaTerraform" {
  ami                         = "ami-0a5b0d219e493191b"
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.SG_viaTerraform.id]
  associate_public_ip_address = true
}