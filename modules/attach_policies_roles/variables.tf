variable "attachment_name" {
  description = "Name of the attachment"
  type        = string
  default     = "dev_policy_attachment"
}


variable "policies_to_attach" {
  description = "List of policies that needs to be attached to the group"
  type        = map(string)
}

variable "role_name" {
  description = "Name of the role that needs to be attached with a policy"
  type        = string
}