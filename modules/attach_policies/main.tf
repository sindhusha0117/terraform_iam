resource "aws_iam_policy_attachment" "group_attach" {
  name       = var.attachment_name
  groups     = var.group_name
  for_each   = toset(var.group_policies)
  policy_arn = each.value
}