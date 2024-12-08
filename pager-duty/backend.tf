terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/pd-resources"
    region = "us-east-1"
  }
}