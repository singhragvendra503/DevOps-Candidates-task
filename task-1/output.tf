output "cloud_run_url" {
  value       = google_cloud_run_service.hello_world.status[0].url
  description = "The URL of the deployed Cloud Run service"
}