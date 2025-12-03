variable "alert_emails" {
  type        = list(string)
  description = "Email recipients for AWS Health alerts"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "environment" {
  type    = string
  default = "prod"
}

