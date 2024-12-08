terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/s3-alerts"
    region = "us-east-1"
  }
}