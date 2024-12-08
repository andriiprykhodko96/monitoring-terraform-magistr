variable "s3_filter_map" {
  description = "List of S3 filters name and prefixes"
  type        = map(string)
}

variable "s3_bucket" {
  description = "List buckets"
  type        = list(string)
}