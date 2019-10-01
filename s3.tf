resource "aws_s3_bucket" "bucket" {
  bucket = "invoicer-config-bucket"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "invoicer_definition" {
  bucket = "${aws_s3_bucket.bucket.id}"
  key    = "app-version.json"
  source = "../app-version.json"
}