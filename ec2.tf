resource "aws_security_group" "invoicer_sg" {
	name = "InvoicerSg"
	description = "Sg for Invoicer"
	vpc_id =  data.aws_vpc.default.id

	ingress {
    	from_port = 5432
    	to_port = 5432
    	protocol = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
    }
}
