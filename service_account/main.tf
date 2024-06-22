resource "google_service_account" "iam_sa" {
  account_id   = "service-account-id"
  display_name = "IAM management Service Account"
}

resource "google_project_iam_binding" "iam_sa_binding" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"

  members = [
    "serviceAccount:${google_service_account.iam_sa.email}"
  ]
}

resource "google_service_account_iam_binding" "impersonate_sa" {
  service_account_id = "google_service_account.iam_sa.id"
  role               = "roles/iam.serviceAccountTokenCreator"

  members = [
    "user:${google_service_account.iam_sa.email}"
  ]
}