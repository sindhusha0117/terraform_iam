resource "aws_iam_role" "create_role" {
  name               = var.role_name
  assume_role_policy = var.policy_json

  tags = {
    pipeline = "terraform"
  }
}