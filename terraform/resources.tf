module "org" {
  source = "github.com/xascode/modules//org?ref=v0.1.0-alpha.1"
  
  name   = var.organization_name
}

module "env" {
  source = "github.com/xascode/modules//env?ref=v0.1.0-alpha.1"

  name   = var.environment
  parent = {
    name = module.org.name
    path = module.org.path
  }
}

module "corp" {
  source = "github.com/xascode/modules//ou?ref=v0.1.0-alpha.1"

  name   = "corp"
  parent = {
    name = module.env.name
    path = module.env.path
  }
}

module "snapshots" {
  source = "github.com/xascode/modules//prj_container?ref=v0.1.0-alpha.1"

  name   = "snapshots"
  parent = {
    name = module.corp.name
    path = module.corp.path
  }
}

module "snapshots_project" {
  source = "github.com/xascode/modules//project?ref=v0.1.0-alpha.3"

  name   = "snapshots"
  parent = {
    name = module.snapshots.name
    path = module.snapshots.path
  }

  billing_account = var.billing_account
}
