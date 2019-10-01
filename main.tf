provider "aws" {
  region  = "us-west-1"
}

output "PublicEndpoint" {
  value = aws_elastic_beanstalk_environment.invoicer.cname
}