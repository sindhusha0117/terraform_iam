provider "aws" {
  region = "us-east-1"
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
  source     = "./modules/attach_policies"
  group_name = [module.create_dev_group.created_group_name]
}