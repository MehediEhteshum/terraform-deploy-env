resource "google_compute_network" "vnet1" {
  name                    = "vnet1"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "snet1" {
  name          = "snet1-vnet1"
  ip_cidr_range = "10.123.1.0/24"
  network       = google_compute_network.vnet1.id
}
