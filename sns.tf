resource "aws_sns_topic" "alerts" {
  name              = "aws-health-alerts-${var.environment}"
  kms_master_key_id = "alias/aws/sns"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "AWS Health Alerting"
  }
}

resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each  = toset(var.alert_emails)
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = each.value
}
