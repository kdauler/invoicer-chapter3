data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "subnet_a" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "${var.availability_zone_a}"
}

data "aws_subnet" "subnet_c" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "${var.availability_zone_c}"
}
