provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "data_policy_document" {
  source = "./modules/data"
}

module "create_s3_policy" {
  source      = "./modules/create_policy"
  policy_name = "s3_full_access_mgd"
  policy_doc  = module.data_policy_document.s3_full_access_doc
}

module "create_dev_group" {
  source = "./modules/create_groups"
}

module "create_dev_users" {
  source   = "./modules/create_users"
  dev_user = ["bboyapa1"]
}

module "add_users_to_group" {
  source     = "./modules/add_users_to_group"
  group_name = module.create_dev_group.created_group_name
  users_list = module.create_dev_users.dev_users_name
}

module "attach_policy_to_dev_group" {
  source          = "./modules/attach_policies_groups"
  attachment_name = "dev_group_attachment"
  group_name      = module.create_dev_group.created_group_name
  policies_to_attach = { "s3_policy" = module.create_s3_policy.policy_arn,
    "gl_policy" = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess",
  "cw_policy" = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess" }
}


module "create_glue_role" {
  source      = "./modules/create_roles"
  role_name   = "dev_glue_role"
  policy_json = module.data_policy_document.glue_role_doc
}

module "attach_policies_to_glue_role" {
  source          = "./modules/attach_policies_roles"
  attachment_name = "glue_role_policy_attachment"
  role_name       = module.create_glue_role.role_name
  policies_to_attach = { "s3_policy" = module.create_s3_policy.policy_arn,
    "gl_policy" = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole",
  "cw_policy" = "arn:aws:iam::aws:policy/CloudWatchFullAccess" }
}