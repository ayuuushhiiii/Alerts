output "sns_topic_arn" {
  value       = aws_sns_topic.alerts.arn
  description = "SNS topic created for AWS Health alerts"
}

output "event_rule_name" {
  value       = aws_cloudwatch_event_rule.health_events.name
  description = "EventBridge rule capturing AWS Health events"
}
