terraform {
  required_providers {
    google = {
      version = "~> 4.7.0"
    }
  }
}

terraform {

  backend "gcs" {
    bucket = "<bucket-name>"
    prefix = "<prefix>"

    impersonate_service_account = "<service-account-email>"

  }

}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}