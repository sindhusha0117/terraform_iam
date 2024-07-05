resource "aws_iam_group_policy_attachment" "policy_attach" {
  group      = var.group_name
  for_each   = var.policies_to_attach
  policy_arn = each.value
}