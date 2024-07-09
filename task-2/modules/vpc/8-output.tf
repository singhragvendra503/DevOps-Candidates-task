output "vpc_name" {
  value= google_compute_network.vpc_network.name
}

output "public_subnet_id" {
  value = google_compute_subnetwork.public_subnets[0].id
}
