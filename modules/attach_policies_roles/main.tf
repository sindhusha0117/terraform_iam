resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = var.role_name
  for_each   = var.policies_to_attach
  policy_arn = each.value
}