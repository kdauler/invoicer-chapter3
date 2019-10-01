resource "aws_db_subnet_group" "db_group" {
  name       = "main"
  subnet_ids = [data.aws_subnet.subnet_a.id, data.aws_subnet.subnet_c.id]

  tags = {
    Name = "Public DB subnet group"
  }
}

resource "aws_db_instance" "invoicer_db" {
  skip_final_snapshot  = "true"
  allocated_storage    = 5
  engine               = "postgres"
  engine_version       = "9.6.2"
  identifier		   = "invoicerdb"
  instance_class       = "db.t2.micro"
  name                 = "invoicer"
  username             = "invoicer"
  password             = "${var.db_pass}"
  publicly_accessible  = true
  vpc_security_group_ids = ["${aws_security_group.invoicer_sg.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.db_group.name}"
  tags = {
  	Name     		   = "invoicer-api"
  	Owner              = "kdauler"
  }
}