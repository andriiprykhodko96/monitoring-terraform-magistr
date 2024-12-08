terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/cloudfront-alert"
    region = "us-east-1"
  }
}