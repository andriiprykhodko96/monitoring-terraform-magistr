module "s3-alerts" {
  source = "../modules-tf/cw-s3-alerts"

  for_each = toset(var.s3_bucket)
  s3_bucket        = each.value

  create_s3_4xx_errors       = true
  create_s3_5xx_errors       = true
  create_s3_bytes_downloaded = true
  create_s3_bytes_uploaded   = true
  create_s3_delete_requests  = true
  create_s3_get_requests     = true
  create_s3_list_requests    = true
}

