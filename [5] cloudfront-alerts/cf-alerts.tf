module "cloudfront-alerts" {
  source = "../modules-tf/cw-cloudfront-alerts"
  cloudfront_distribution = "EW73D5COFU2T3"
  
  create_cf_4xx_errors = true
  create_cf_5xx_errors = true
  create_cf_bytes_downloaded = true
  create_cf_bytes_uploaded = true
  create_cf_rejected_requests = true
  create_cf_requests_count = true
  create_cf_waf_blocked_requests = true
}

