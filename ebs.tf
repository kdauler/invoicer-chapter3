resource "aws_elastic_beanstalk_application" "current" {
  name        = "latest-invoicer"
  description = "latest invoicer"
}

data "aws_elastic_beanstalk_solution_stack" "docker_stack" {
  most_recent = true
  name_regex = ".+Amazon Linux.+running Docker.+"
}

resource "aws_elastic_beanstalk_environment" "invoicer" {
  name                = "invoicer-api"
  description	 	  = "InvoicerEnv"
  application         = "${aws_elastic_beanstalk_application.current.name}"
  solution_stack_name = data.aws_elastic_beanstalk_solution_stack.docker_stack.name
  tier				  = "WebServer"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_USE_POSTGRES"
    value     = "yes"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_POSTGRES_USER"
    value     = "invoicer"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_POSTGRES_PASSWORD"
    value     = "${var.db_pass}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_POSTGRES_DB"
    value     = "invoicer"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_POSTGRES_HOST"
    value     = "${aws_db_instance.invoicer_db.address}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "INVOICER_POSTGRES_SSLMODE"
    value     = "disable"
  }
}

resource "aws_elastic_beanstalk_application_version" "ebs_version" {
	name        = "${aws_elastic_beanstalk_application.current.name}"
  	application = "${aws_elastic_beanstalk_application.current.name}"
  	bucket      = "${aws_s3_bucket.bucket.id}"
  	key         = "${aws_s3_bucket_object.invoicer_definition.id}"
}