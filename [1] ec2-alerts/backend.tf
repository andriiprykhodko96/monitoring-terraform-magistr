terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/test"
    region = "us-east-1"
  }
}