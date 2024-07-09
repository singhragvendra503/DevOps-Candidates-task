# Create a router
resource "google_compute_router" "router" {
  name    = "${var.appname}-${var.environment}-router"
  region  = var.region
  network = google_compute_network.vpc_network.id
  depends_on = [google_compute_network.vpc_network]

  bgp {
    asn = 64514
  }
}
