terraform {
  backend "s3" {
    bucket = "a-prykhodko-backet"
    key    = "monitoring-terraform/dynamodb-alert"
    region = "us-east-1"
  }
}