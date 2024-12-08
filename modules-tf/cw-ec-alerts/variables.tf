// overall values 
variable "elasticache_db" {
  description = "S3 bucket name"
  type        = string
}

// creation toggles

variable "create_ec_cpu" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_engine_cpu" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_evictions" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_curr_connections" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_network_bytes_in" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_network_bytes_out" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_new_connections" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec_authentication_failures" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}
// thresholds values 


variable "ec_cpu_threshold" {
  description = "Threshold for ElastiCache CPU utilization"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 75  # CPU usage above 75% is critical
      datapoints_to_alarm = 2   # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_engine_cpu_threshold" {
  description = "Threshold for ElastiCache engine CPU utilization"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 85  # Engine CPU above 85% is critical
      datapoints_to_alarm = 2   # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_evictions_threshold" {
  description = "Threshold for ElastiCache evictions"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 50  # Evictions indicate memory issues
      datapoints_to_alarm = 1   # Trigger alarm on first breach
    }
  nullable = false
}

variable "ec_curr_connections_threshold" {
  description = "Threshold for ElastiCache current connections"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 500  # Current connections above 500 may be high
      datapoints_to_alarm = 2    # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_network_bytes_in_threshold" {
  description = "Threshold for ElastiCache network bytes in"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 500000  # Network in traffic (bytes) exceeds 500KB
      datapoints_to_alarm = 2       # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_network_bytes_out_threshold" {
  description = "Threshold for ElastiCache network bytes out"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 500000  # Network out traffic (bytes) exceeds 500KB
      datapoints_to_alarm = 2       # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_new_connections_threshold" {
  description = "Threshold for ElastiCache new connections"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 2
      threshold           = 100  # New connections above 100 may be high
      datapoints_to_alarm = 2    # Trigger alarm after 2 consecutive breaches
    }
  nullable = false
}

variable "ec_authentication_failures_threshold" {
  description = "Threshold for ElastiCache authentication failures"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 3  # More than 3 authentication failures are critical
      datapoints_to_alarm = 1 # Trigger alarm on first breach
    }
  nullable = false
}