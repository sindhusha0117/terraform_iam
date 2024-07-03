output "dev_users_name" {
  value = values(aws_iam_user.dev_user)[*].name
}