resource "google_compute_network" "vnet1" {
  name                    = "vnet1"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "snet1" {
  name          = "snet1-vnet1"
  ip_cidr_range = "10.123.1.0/24"
  region        = var.location
  network       = google_compute_network.vnet1.id
}

resource "google_compute_firewall" "firewall1" {
  name    = "firewall1"
  network = google_compute_network.vnet1.self_link

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "vm1" {
  name         = "vm1"
  machine_type = "e2-medium"
  zone         = "${var.location}-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vnet1.self_link
    subnetwork = google_compute_subnetwork.snet1.self_link
  }

  metadata_startup_script = file("./customdata.tpl")

  labels = {
    environment = var.environment
  }
}
