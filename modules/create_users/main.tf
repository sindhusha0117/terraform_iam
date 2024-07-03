resource "aws_iam_user" "dev_user" {
  for_each      = toset(var.dev_user)
  name          = each.value
  force_destroy = true

  tags = {
    pipeline = "terraform"
  }

}