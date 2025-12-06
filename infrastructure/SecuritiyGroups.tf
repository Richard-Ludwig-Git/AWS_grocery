resource "aws_security_group" "SG_viaTerraform" {
  name = "SG-viaTerraform-security-group"
}

resource "aws_security_group" "RDS_SG_viaTerraform" {
  name = "RDS-SG-viaTerraform-security-group"
}

resource "aws_security_group_rule" "allow_income_from_ec2" {
  from_port         = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.RDS_SG_viaTerraform.id
  to_port           = 5432
  type              = "ingress"
  cidr_blocks = [format("%s/32", aws_instance.EC2-viaTerraform.private_ip)]
}

resource "aws_security_group_rule" "allow_http_income" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.SG_viaTerraform.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_https_income" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.SG_viaTerraform.id
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_custom_TCP_income" {
  from_port         = 5000
  protocol          = "tcp"
  security_group_id = aws_security_group.SG_viaTerraform.id
  to_port           = 5000
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_SSH_income" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.SG_viaTerraform.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.SG_viaTerraform.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}