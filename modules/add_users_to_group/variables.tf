variable "group_name" {
  description = "Name of the group the users needs to be added to"
  type        = string
}

variable "users_list" {
  description = "List of users that needs to be added to the group"
  type        = list(string)
}

variable "attachment_name" {
  description = "Name of the attachment of users to group"
  type        = string
  default     = "dev_group_attachment"
}