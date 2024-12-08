resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  count             = var.create_ec2_cpu ? 1 : 0
  alarm_name        = format("[EC2] %s - High instance CPU", var.ec2_instance_name)
  alarm_description = "Alarm on high instance CPU"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec2_high_cpu_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec2_high_cpu_threshold.evaluation_periods
  threshold           = var.ec2_high_cpu_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "CPUUtilization"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/EC2"

  alarm_actions   = local.action_ec2_alert

  dimensions = {
    InstanceId = var.ec2_instance
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_network_in" {
  count             = var.create_ec2_network_in ? 1 : 0
  alarm_name        = format("[EC2] %s - High network IN throutput", var.ec2_instance_name)
  alarm_description = "Alarm on high network in throutput"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec2_network_in_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec2_network_in_threshold.evaluation_periods
  threshold           = var.ec2_network_in_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "NetworkIn"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/EC2"

  alarm_actions   = local.action_ec2_alert

  dimensions = {
    InstanceId = var.ec2_instance
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "out" {
  count             = var.create_network_out ? 1 : 0
  alarm_name        = format("[EC2] %s - High network OUT throutput", var.ec2_instance_name)
  alarm_description = "Alarm on high network OUT throutput"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec2_network_out_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec2_network_out_threshold.evaluation_periods
  threshold           = var.ec2_network_out_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "NetworkOut"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/EC2"

  alarm_actions   = local.action_ec2_alert

  dimensions = {
    InstanceId = var.ec2_instance
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}

resource "aws_cloudwatch_metric_alarm" "status_check" {
  count             = var.create_status_check ? 1 : 0
  alarm_name        = format("[EC2] %s - Failed status check", var.ec2_instance_name)
  alarm_description = "Alarm when instance failed status check"

  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = var.ec2_status_check_threshold.datapoints_to_alarm
  evaluation_periods  = var.ec2_status_check_threshold.evaluation_periods
  threshold           = var.ec2_status_check_threshold.threshold
  treat_missing_data  = "notBreaching"

  metric_name = "StatusCheckFailed"
  period      = "60"
  statistic   = "Sum"
  namespace   = "AWS/EC2"

  alarm_actions   = local.action_ec2_alert

  dimensions = {
    InstanceId = var.ec2_instance
  }

  lifecycle {
    ignore_changes = [evaluation_periods, threshold, period, datapoints_to_alarm]
  }
}


