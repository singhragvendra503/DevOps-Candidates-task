# Create a NAT gateway for private subnets
resource "google_compute_router_nat" "nat" {
  name                               = "${var.appname}-${var.environment}-router-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ips                            = [google_compute_address.nat.self_link]
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_address" "nat" {
  name         = "${var.appname}-${var.environment}-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}
