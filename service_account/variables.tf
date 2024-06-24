variable "terraform_service_account" {
  type        = string
  description = "email adress of the service account used for terraform"
  default     = "terraform-iac-compute@mytesting-400910.iam.gserviceaccount.com"
}

variable "project_id" {
  type        = string
  description = "ID of the project in scope"
  default     = "mytesting-400910"
}

variable "region" {
  type        = string
  description = "default region"
  default     = "us-central1"
}


