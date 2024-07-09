output "cloud_run_url" {
  value       = module.cloud_run.cloud_run_url
  description = "The URL of the deployed Cloud Run service"
}