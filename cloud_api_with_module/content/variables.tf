variable aws_region {
  type        = string
  description = "AWS region in which to provision."
  default     = "us-west-2"
}
variable instance_type {
  type        = string
  description = "type of EC2 instance to provision."
  default     = "t2.small"
}
variable "AWS_ACCESS_KEY_ID" {
        description = "Access key to AWS console"
}
variable "AWS_SECRET_ACCESS_KEY" {
        description = "Secret key to AWS console"
}
variable "AWS_SESSION_TOKEN" {
}

