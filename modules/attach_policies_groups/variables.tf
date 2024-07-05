variable "attachment_name" {
  description = "Name of the attachment"
  type        = string
  default     = "dev_policy_attachment"
}

variable "group_name" {
  description = "Name of the group that needs to be attached with the policy"
  type        = string
}

variable "policies_to_attach" {
  description = "List of policies that needs to be attached to the group"
  type        = map(string)
}
