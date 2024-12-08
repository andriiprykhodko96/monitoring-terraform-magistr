// overall values 
variable "cloudfront_distribution" {
  description = "cloudfront name"
  type        = string
}

// creation toggles

variable "create_cf_4xx_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_5xx_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_requests_count" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_bytes_uploaded" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_bytes_downloaded" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_rejected_requests" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_cf_waf_blocked_requests" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

// thresholds values 

variable "cf_4xx_threshold" {
  description = "Threshold for CloudFront 4xx errors"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 50  # More than 50 4xx errors is critical
      datapoints_to_alarm = 2   # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "cf_5xx_threshold" {
  description = "Threshold for CloudFront 5xx errors"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 10  # More than 10 5xx errors is critical
      datapoints_to_alarm = 2   # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "cf_requests_count_threshold" {
  description = "Threshold for CloudFront requests count"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 1000  # More than 1000 requests in one period is high
      datapoints_to_alarm = 1     # Trigger alarm on first breach
    }
  nullable = false
}

variable "cf_bytes_uploaded_threshold" {
  description = "Threshold for CloudFront bytes uploaded"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 500000  # More than 500KB uploaded is significant
      datapoints_to_alarm = 2       # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "cf_bytes_downloaded_threshold" {
  description = "Threshold for CloudFront bytes downloaded"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 1000000  # More than 1MB downloaded is significant
      datapoints_to_alarm = 2        # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "cf_rejected_requests_threshold" {
  description = "Threshold for CloudFront rejected requests"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10  # More than 10 rejected requests is critical
      datapoints_to_alarm = 1   # Trigger alarm on first breach
    }
  nullable = false
}

variable "cf_waf_blocked_requests_threshold" {
  description = "Threshold for CloudFront WAF blocked requests"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 20  # More than 20 blocked requests may indicate abuse
      datapoints_to_alarm = 1   # Trigger alarm on first breach
    }
  nullable = false
}
