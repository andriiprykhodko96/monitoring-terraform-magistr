// overall values 
variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "s3_filter_name" {
  description = "Metric name for supplied bucket filter"
  type        = string
  default     = ""
}
variable "s3_filter_prefix" {
  description = "Filter prefix to be used in bucket metric"
  type        = string
  default     = ""
}

// creation toggles

variable "create_s3_4xx_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_5xx_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_bytes_uploaded" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_bytes_downloaded" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_delete_requests" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_list_requests" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_s3_get_requests" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

// thresholds values 


variable "s3_4xx_threshold" {
  description = "Threshold for s3 4xx errors"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 5
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_5xx_threshold" {
  description = "Threshold for s3 5xx errors"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 5
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_bytes_uploaded_threshold" {
  description = "Threshold for s3 bytes_uploaded metric"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10000
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_bytes_downloaded_threshold" {
  description = "Threshold for s3 bytes_downloaded metrics"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10000
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_delete_requests_threshold" {
  description = "Threshold for s3 delete requests metric"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 5
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_bytes_list_requests_threshold" {
  description = "Threshold for s3 list requests metrics"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 5
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "s3_bytes_get_requests_threshold" {
  description = "Threshold for s3 get_requests metrics"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 5
      datapoints_to_alarm = 1
    }
  nullable = false
}