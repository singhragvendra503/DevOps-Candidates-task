# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name                            = "${var.appname}-${var.environment}-vpc"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false
}


