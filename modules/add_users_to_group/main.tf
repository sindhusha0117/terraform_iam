resource "aws_iam_group_membership" "add_users_to_group" {
  name  = var.attachment_name
  users = var.users_list
  group = var.group_name
}