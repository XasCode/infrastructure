module "ou" {
  source = "./vendor/modules/folder"
  
  name   = var.name
  parent = var.parent

  envs   = var.envs
  environment    = var.environment
}

module "terraform" {
  source = "./vendor/modules/project"
  
  name   = "terraform"
  parent = {
    name = module.ou.name
    path = module.ou.path
  }  

  billing_account = var.billing_account

  envs   = var.envs
  environment    = var.environment
}


module "snapshots" {
 source = "./vendor/modules/project"
  
  name   = "snapshots"
  parent = {
    name = module.ou.name
    path = module.ou.path
  }

  billing_account = var.billing_account

  envs   = var.envs
  environment    = var.environment
}

resource "random_id" "random" {
  byte_length = 3
}

provider "archive" {}


data "archive_file" "srcfiles" {
  type        = "zip"
  output_path = "snapshots.zip"
  source_dir  = "./src"
}
