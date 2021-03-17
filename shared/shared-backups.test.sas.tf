resource "google_service_account" "shared-backups-test-svc-check-snapshots" {
  account_id   = "svc-check-snapshots-${random_id.project.hex}"
  display_name = "shared-backups-test-svc-check-snapshots"
  project      = google_project.backups-test.project_id
}

resource "google_organization_iam_binding" "shared-backups-test-bind-check-snapshots" {
  org_id  = var.organization_id
  role    = "roles/${google_organization_iam_custom_role.shared-backups-test-role-svc-check-snapshots.role_id}"

  members = [
    "serviceAccount:${google_service_account.shared-backups-test-svc-check-snapshots.email}"
  ]

  depends_on = [null_resource.delay]
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 10"
  }
  triggers = {
    "before" = google_service_account.shared-backups-test-svc-check-snapshots.id
  }
}
