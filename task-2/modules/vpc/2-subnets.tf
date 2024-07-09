# Define subnets

resource "google_compute_subnetwork" "public_subnets" {
  count         = length(var.public_subnets_cidr_range)
  name          = "public-subnet-${count.index + 1}"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = var.public_subnets_cidr_range[count.index]
}

resource "google_compute_subnetwork" "private_subnets" {
  count         = length(var.private_subnets_cidr_range)
  name          = "private-subnet-${count.index + 1}"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = var.private_subnets_cidr_range[count.index]
}

