resource "aws_db_instance" "DB_viaTerraform" {
  instance_class = "db.t3.micro"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "17.6"
  username = "postgres"
  password = "postgres"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.RDS_SG_viaTerraform.id]
  publicly_accessible = false
}