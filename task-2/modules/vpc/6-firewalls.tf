# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh-prod" {
  name    = "allow-ssh-${var.appname}-${var.environment}"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  source_ranges = ["0.0.0.0/0"]
}
