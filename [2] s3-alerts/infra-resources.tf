resource "aws_s3_bucket" "my_bucket" {
  bucket = "andrii-pr-bucket"

  tags = {
    Name = "WebServer-Bucket"
  }
}