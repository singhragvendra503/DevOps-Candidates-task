# Create a public internet gateway
resource "google_compute_route" "public_internet_gateway" {
  name              = "public-internet-gateway"
  network           = google_compute_network.vpc_network.self_link
  dest_range        = "0.0.0.0/0"
  next_hop_gateway  = "default-internet-gateway"
}