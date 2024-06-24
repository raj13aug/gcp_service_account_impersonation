resource "google_project_iam_member" "project_viewer" {
  for_each = toset(var.gcp_project_viewer)
  project  = var.gcp_project_id
  role     = "roles/viewer"
  member   = "user:${each.value}"
}


resource "google_project_iam_member" "allow_sa_impersonation_tokens" {
  for_each = toset(var.gcp_project_viewer)
  project  = var.gcp_project_id
  role     = "roles/iam.serviceAccountTokenCreator"
  member   = "user:${each.value}"
}