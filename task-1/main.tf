# Configure the Google Cloud provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = file("./ferret-cloud-dev-555c59a87645.json")
  project = var.project_id
  region  = var.region
}


# # https://www.terraform.io/language/settings/backends/gcs
# terraform {
#   backend "gcs" {
#     bucket = "ferret-prod"
#     prefix = "terraform/state"
#   }
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 5.20.0"
#     }
#   }
# }


# Enable required APIs
resource "google_project_service" "cloud_run_api" {
  project = var.project_id
  service = "run.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloud_build_api" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "artifact_registry_api" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"

  disable_on_destroy = false
}

# Create Artifact Registry repository
resource "google_artifact_registry_repository" "repo" {
  provider = google-beta
  project  = var.project_id
  location = var.region
  repository_id = "my-repo"
  format = "DOCKER"

  depends_on = [google_project_service.artifact_registry_api]
}

# Deploy Cloud Run service
resource "google_cloud_run_service" "hello_world" {
  name     = "hello-world"
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/aws-move/hello-world:latest"
        ports {
          container_port = 80
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.cloud_run_api]
}

# Make the Cloud Run service publicly accessible
resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.hello_world.name
  location = google_cloud_run_service.hello_world.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}