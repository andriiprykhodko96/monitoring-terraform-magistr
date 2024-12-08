resource "pagerduty_service" "monitoring_service" {
  name                    = "Monitoring Service"
  escalation_policy = pagerduty_escalation_policy.engineering_policy.id
}

resource "pagerduty_service_integration" "monitoring_integration" {
  name      = "Monitoring Integration"
  service   = pagerduty_service.monitoring_service.id
  type      = "events_api_v2_inbound_integration" 
}

resource "aws_sns_topic" "pagerduty_topic" {
  name = "pagerduty-alerts"
}

resource "aws_sns_topic_subscription" "pagerduty_subscription" {
  topic_arn = aws_sns_topic.pagerduty_topic.arn
  protocol  = "https"
  endpoint  = "https://events.pagerduty.com/integration/5c4b540dfc174001c0dec30eea8cecd3/enqueue"
  endpoint_auto_confirms = true
}

output "pd-topic_arn" {
  value = aws_sns_topic.pagerduty_topic.arn
}