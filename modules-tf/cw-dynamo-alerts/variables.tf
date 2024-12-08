// overall values 
variable "dynamo_db" {
  description = "Dynamo DB name"
  type        = string
}

// creation toggles

variable "create_dynamo_req_throttled" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_dynamo_req_returned_item" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_dynamo_conditional_check_failed" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_dynamo_user_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_dynamo_system_errors" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

// thresholds values 

variable "dynamo_req_throttled_threshold" {
  description = "Threshold for dynamo requests throttled"
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

variable "dynamo_req_returned_item_threshold" {
  description = "Threshold for DynamoDB returned items"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 100
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "dynamo_conditional_check_failed_threshold" {
  description = "Threshold for DynamoDB conditional check failures"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "dynamo_user_errors_threshold" {
  description = "Threshold for DynamoDB user errors"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 50
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "dynamo_system_errors_threshold" {
  description = "Threshold for DynamoDB system errors"
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