output "glue_role_doc" {
  value = data.aws_iam_policy_document.glue_role_doc.json
}

output "s3_full_access_doc" {
  value = data.aws_iam_policy_document.s3_full_access.json
}