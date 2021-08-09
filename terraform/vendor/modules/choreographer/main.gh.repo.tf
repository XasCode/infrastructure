resource "github_repository" "repository" {
  count = var.environment == "devl" ? length(var.managed) : 0

  name             = var.managed[count.index].name
  description      = "Automated"

  visibility       = "public"
  has_issues       = false
  has_projects     = false
  has_wiki         = false
  is_template      = false
  has_downloads    = false
  auto_init        = true
  license_template = "mit"
}

data "github_repository" "repository" {
  count = length(var.managed)

  full_name = "${var.gh_org}/${var.managed[count.index].name}"

  depends_on = github_repository.repository
}
