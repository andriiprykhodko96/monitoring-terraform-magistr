resource "aws_cloudwatch_metric_alarm" "dynamo_req_thottled" {
  count             = var.create_dynamo_req_throttled ? 1 : 0
  alarm_name        = format("[DynamoDB] %s - High count of requests throttled",var.dynamo_db)
  alarm_description = "Alarm on high count of requests throttled"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.dynamo_req_throttled_threshold.datapoints_to_alarm
  evaluation_periods  = var.dynamo_req_throttled_threshold.evaluation_periods
  threshold           = var.dynamo_req_throttled_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "ThrottledRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/DynamoDB"

  alarm_actions   = local.action_dynamo_alert

  dimensions = {
    TableName = var.dynamo_db
    Operation = "scan"
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamo_req_returned_item" {
  count             = var.create_dynamo_req_returned_item ? 1 : 0
  alarm_name        = format("[DynamoDB] %s - High count of returned items", var.dynamo_db)
  alarm_description = "Alarm on high count of returned items"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.dynamo_req_returned_item_threshold.datapoints_to_alarm
  evaluation_periods  = var.dynamo_req_returned_item_threshold.evaluation_periods
  threshold           = var.dynamo_req_returned_item_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "ReturnedItemCount"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/DynamoDB"

  alarm_actions = local.action_dynamo_alert

  dimensions = {
    TableName = var.dynamo_db
    Operation = "Scan"
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamo_conditional_check_failed" {
  count             = var.create_dynamo_conditional_check_failed ? 1 : 0
  alarm_name        = format("[DynamoDB] %s - High count of conditional check failures", var.dynamo_db)
  alarm_description = "Alarm on high count of conditional check failures"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.dynamo_conditional_check_failed_threshold.datapoints_to_alarm
  evaluation_periods  = var.dynamo_conditional_check_failed_threshold.evaluation_periods
  threshold           = var.dynamo_conditional_check_failed_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "ConditionalCheckFailedRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/DynamoDB"

  alarm_actions = local.action_dynamo_alert

  dimensions = {
    TableName = var.dynamo_db
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamo_user_errors" {
  count             = var.create_dynamo_user_errors ? 1 : 0
  alarm_name        = format("[DynamoDB] %s - High count of user errors", var.dynamo_db)
  alarm_description = "Alarm on high count of user errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.dynamo_user_errors_threshold.datapoints_to_alarm
  evaluation_periods  = var.dynamo_user_errors_threshold.evaluation_periods
  threshold           = var.dynamo_user_errors_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "UserErrors"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/DynamoDB"

  alarm_actions = local.action_dynamo_alert

  dimensions = {
    TableName = var.dynamo_db
    Operation = "PutItem"
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamo_system_errors" {
  count             = var.create_dynamo_system_errors ? 1 : 0
  alarm_name        = format("[DynamoDB] %s - High count of system errors", var.dynamo_db)
  alarm_description = "Alarm on high count of system errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.dynamo_system_errors_threshold.datapoints_to_alarm
  evaluation_periods  = var.dynamo_system_errors_threshold.evaluation_periods
  threshold           = var.dynamo_system_errors_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "SystemErrors"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/DynamoDB"

  alarm_actions = local.action_dynamo_alert

  dimensions = {
    TableName = var.dynamo_db
    Operation = "PutItem"
  }
  
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

