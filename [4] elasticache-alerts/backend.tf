terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/elasticache-alert"
    region = "us-east-1"
  }
}