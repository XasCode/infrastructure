/*
resource "google_cloudfunctions_function_iam_binding" "binding" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  project = module.project.id
  region = local.region
  cloud_function = google_cloudfunctions_function.function-choreographer[count.index].name
  role = "roles/cloudfunctions.invoker"
  members = [
    "allUsers"
  ]
}

resource "google_cloudfunctions_function_iam_binding" "svcacct" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  project = module.project.id
  region = local.region
  cloud_function = google_cloudfunctions_function.function-choreographer[count.index].name
  role = google_organization_iam_custom_role.role-svc-choreographer[count.index].name
  members = [
    "serviceAccount:${google_service_account.svc-choreographer[count.index].email}"
  ]
}

resource "google_secret_manager_secret_iam_binding" "binding" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  project = module.project.id
  secret_id = google_secret_manager_secret.secret-basic[count.index].id
  role = google_organization_iam_custom_role.role-svc-choreographer[count.index].name
  members = [
    "serviceAccount:${google_service_account.svc-choreographer[count.index].email}"
  ]
}

resource "google_project_iam_binding" "project" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  project = module.project.id
  role = google_organization_iam_custom_role.role-svc-choreographer[count.index].name
  members = [
    "serviceAccount:${google_service_account.svc-choreographer[count.index].email}"
  ]
}

resource "google_sourcerepo_repository_iam_binding" "binding" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  project = module.project.id
  repository = google_sourcerepo_repository.choreographer-repo[count.index].name
  role = "roles/source.writer"
  members = [
    "serviceAccount:${module.project.number}@cloudbuild.gserviceaccount.com",
  ]
}
*/