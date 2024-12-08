resource "aws_cloudwatch_metric_alarm" "cf_4xx_threshold" {
  count             = var.create_cf_4xx_errors ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High 4XX errors", var.cloudfront_distribution)
  alarm_description = "Alarm on high amount of 4XX errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_4xx_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_4xx_threshold.evaluation_periods
  threshold           = var.cf_4xx_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "HTTPCode_4XX_Count"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_5xx_threshold" {
  count             = var.create_cf_5xx_errors ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High 5XX errors", var.cloudfront_distribution)
  alarm_description = "Alarm on high amount of 5XX errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_5xx_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_5xx_threshold.evaluation_periods
  threshold           = var.cf_5xx_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "HTTPCode_5XX_Count"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_requests_count_threshold" {
  count             = var.create_cf_requests_count ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High request count", var.cloudfront_distribution)
  alarm_description = "Alarm on high request count"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_requests_count_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_requests_count_threshold.evaluation_periods
  threshold           = var.cf_requests_count_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "Requests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_bytes_uploaded_threshold" {
  count             = var.create_cf_bytes_uploaded ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High bytes uploaded", var.cloudfront_distribution)
  alarm_description = "Alarm on high bytes uploaded"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_bytes_uploaded_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_bytes_uploaded_threshold.evaluation_periods
  threshold           = var.cf_bytes_uploaded_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "BytesUploaded"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_bytes_downloaded_threshold" {
  count             = var.create_cf_bytes_downloaded ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High bytes downloaded", var.cloudfront_distribution)
  alarm_description = "Alarm on high bytes downloaded"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_bytes_downloaded_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_bytes_downloaded_threshold.evaluation_periods
  threshold           = var.cf_bytes_downloaded_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "BytesDownloaded"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_rejected_requests_threshold" {
  count             = var.create_cf_rejected_requests ? 1 : 0
  alarm_name        = format("[CloudFront] %s - High rejected requests", var.cloudfront_distribution)
  alarm_description = "Alarm on high rejected requests"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_rejected_requests_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_rejected_requests_threshold.evaluation_periods
  threshold           = var.cf_rejected_requests_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "RejectedRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "cf_waf_blocked_requests_threshold" {
  count             = var.create_cf_waf_blocked_requests ? 1 : 0
  alarm_name        = format("[CloudFront] %s - WAF blocked requests", var.cloudfront_distribution)
  alarm_description = "Alarm on high WAF blocked requests"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.cf_waf_blocked_requests_threshold.datapoints_to_alarm
  evaluation_periods  = var.cf_waf_blocked_requests_threshold.evaluation_periods
  threshold           = var.cf_waf_blocked_requests_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "WAFBlockedRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/CloudFront"

  alarm_actions = local.action_cf_alert

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}