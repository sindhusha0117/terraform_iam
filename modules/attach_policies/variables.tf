variable "attachment_name" {
  description = "Name of the attachment"
  type        = string
  default     = "dev_policy_attachment"
}

variable "group_name" {
  description = "Name of the group that needs to be attached with the policy"
  type = list(string)
}

variable "group_policies" {
  description = "List of policies that needs to be attached to the group"
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/CloudWatchFullAccess", "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"]
}