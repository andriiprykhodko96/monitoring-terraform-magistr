resource "aws_s3_bucket_metric" "entire_bucket" {
  count  = var.s3_filter_prefix == "" ? 1 : 0
  bucket = var.s3_bucket
  name   = "EntireBucket"
}

resource "aws_s3_bucket_metric" "filtered" {
  count  = var.s3_filter_prefix == "" ? 0 : 1
  bucket = var.s3_bucket
  name   = var.s3_filter_name

  filter {
    prefix = var.s3_filter_prefix
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_4xx" {
  count             = var.create_s3_4xx_errors ? 1 : 0
  alarm_name        = format("[S3] %s - High count of 4XX errors", var.s3_bucket)
  alarm_description = "Alarm on high rate of 4xx errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_4xx_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_4xx_threshold.evaluation_periods
  threshold           = var.s3_4xx_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "4xxErrors"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_5xx" {
  count             = var.create_s3_5xx_errors ? 1 : 0
  alarm_name        = format("[S3] %s - High count of 5XX errors", var.s3_bucket)
  alarm_description = "Alarm on high rate of 5xx errors"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_4xx_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_4xx_threshold.evaluation_periods
  threshold           = var.s3_4xx_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "5xxErrors"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bytes_downloaded" {
  count             = var.create_s3_bytes_downloaded ? 1 : 0
  alarm_name        = format("[S3] %s - High bytes amount downloaded", var.s3_bucket)
  alarm_description = "Alarm on anomaly download activity"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_bytes_downloaded_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_bytes_downloaded_threshold.evaluation_periods
  threshold           = var.s3_bytes_downloaded_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "BytesDownloaded"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bytes_uploaded" {
  count             = var.create_s3_bytes_uploaded ? 1 : 0
  alarm_name        = format("[S3] %s - High bytes amount uploaded", var.s3_bucket)
  alarm_description = "Alarm on anomaly upload activity"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_bytes_uploaded_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_bytes_uploaded_threshold.evaluation_periods
  threshold           = var.s3_bytes_uploaded_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "BytesUploaded"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_delete_requests" {
  count             = var.create_s3_delete_requests ? 1 : 0
  alarm_name        = format("[S3] %s - High delete activity on the bucket", var.s3_bucket)
  alarm_description = "Alarm on anomaly deletion activity"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_delete_requests_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_delete_requests_threshold.evaluation_periods
  threshold           = var.s3_delete_requests_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "DeleteRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_list_requests" {
  count             = var.create_s3_list_requests ? 1 : 0
  alarm_name        = format("[S3] %s - High list requests activity on the bucket", var.s3_bucket)
  alarm_description = "Alarm on anomaly list activity"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_bytes_list_requests_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_bytes_list_requests_threshold.evaluation_periods
  threshold           = var.s3_bytes_list_requests_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "ListRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_get_requests" {
  count             = var.create_s3_get_requests ? 1 : 0
  alarm_name        = format("[S3] %s - High get requests activity on the bucket", var.s3_bucket)
  alarm_description = "Alarm on anomaly get activity"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.s3_bytes_get_requests_threshold.datapoints_to_alarm
  evaluation_periods  = var.s3_bytes_get_requests_threshold.evaluation_periods
  threshold           = var.s3_bytes_get_requests_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "GetRequests"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/S3"

  alarm_actions   = local.action_s3_alert

  dimensions = {
    FilterId   = var.s3_filter_prefix != "" ? "${aws_s3_bucket_metric.filtered[count.index].name}" : "${aws_s3_bucket_metric.entire_bucket[count.index].name}"
    BucketName = var.s3_bucket
  }
  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}