resource "aws_cloudwatch_event_rule" "health_events" {
  name        = "aws-health-events-${var.environment}"
  description = "Catch AWS Health notifications across all regions"

  event_pattern = <<EOF
{
  "source": ["aws.health"]
}
EOF

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_cloudwatch_event_target" "sns_target" {
  rule      = aws_cloudwatch_event_rule.health_events.name
  arn       = aws_sns_topic.alerts.arn
}
