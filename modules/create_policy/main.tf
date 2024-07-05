resource "aws_iam_policy" "create_policy" {
  name   = var.policy_name
  policy = var.policy_doc
}