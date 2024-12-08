// overall values 
variable "ec2_instance" {
  description = "EC2 instance id"
  type        = string
}

variable "ec2_instance_name" {
  description = "EC2 instance name"
  type        = string
}
// creation toggles

variable "create_ec2_cpu" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_ec2_network_in" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_network_out" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}

variable "create_status_check" {
  description = "Variable that decide create alarm or not"
  type        = bool
  default     = false
}


variable "ec2_high_cpu_threshold" {
  description = "Threshold for EC2 high cpu metric"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 80
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "ec2_network_in_threshold" {
  description = "Threshold for EC2 high network in throutput"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10000000
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "ec2_network_out_threshold" {
  description = "Threshold for EC2 high network out throutput"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 10000000
      datapoints_to_alarm = 1
    }
  nullable = false
}

variable "ec2_status_check_threshold" {
  description = "Threshold for EC2 status check alert"
  type        = object({
    evaluation_periods  = number
    threshold           = number
    datapoints_to_alarm = number
  })
  default     = {
      evaluation_periods  = 1
      threshold           = 0
      datapoints_to_alarm = 1
    }
  nullable = false
}