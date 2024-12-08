resource "aws_cloudwatch_metric_alarm" "ec_cpu" {
  count             = var.create_ec_cpu ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High node CPU", var.elasticache_db)
  alarm_description = "Alarm on high CPU"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_cpu_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_cpu_threshold.evaluation_periods
  threshold           = var.ec_cpu_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "CPUUtilization"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_engine_cpu" {
  count             = var.create_ec_engine_cpu ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High engine CPU", var.elasticache_db)
  alarm_description = "Alarm on high engine CPU"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_engine_cpu_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_engine_cpu_threshold.evaluation_periods
  threshold           = var.ec_engine_cpu_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "EngineCPUUtilization"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_evictions" {
  count             = var.create_ec_evictions ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High evictions", var.elasticache_db)
  alarm_description = "Alarm on high evictions"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_evictions_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_evictions_threshold.evaluation_periods
  threshold           = var.ec_evictions_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "Evictions"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_curr_connections" {
  count             = var.create_ec_curr_connections ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High current connections", var.elasticache_db)
  alarm_description = "Alarm on high current connections"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_curr_connections_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_curr_connections_threshold.evaluation_periods
  threshold           = var.ec_curr_connections_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "CurrConnections"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_network_bytes_in" {
  count             = var.create_ec_network_bytes_in ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High network bytes in", var.elasticache_db)
  alarm_description = "Alarm on high network bytes in"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_network_bytes_in_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_network_bytes_in_threshold.evaluation_periods
  threshold           = var.ec_network_bytes_in_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "NetworkBytesIn"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_network_bytes_out" {
  count             = var.create_ec_network_bytes_out ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High network bytes out", var.elasticache_db)
  alarm_description = "Alarm on high network bytes out"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_network_bytes_out_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_network_bytes_out_threshold.evaluation_periods
  threshold           = var.ec_network_bytes_out_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "NetworkBytesOut"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_new_connections" {
  count             = var.create_ec_new_connections ? 1 : 0
  alarm_name        = format("[Elasticache] %s - High new connections", var.elasticache_db)
  alarm_description = "Alarm on high new connections"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_new_connections_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_new_connections_threshold.evaluation_periods
  threshold           = var.ec_new_connections_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "NewConnections"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec_authentication_failures" {
  count             = var.create_ec_authentication_failures ? 1 : 0
  alarm_name        = format("[Elasticache] %s - Authentication failures", var.elasticache_db)
  alarm_description = "Alarm on authentication failures"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec_authentication_failures_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec_authentication_failures_threshold.evaluation_periods
  threshold           = var.ec_authentication_failures_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "AuthenticationFailures"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/ElastiCache"

  alarm_actions   = local.action_ec_alert

  dimensions = {
    CacheClusterId = var.elasticache_db
    CacheNodeId = "0001"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}