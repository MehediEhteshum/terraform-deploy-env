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

resource "google_compute_firewall" "fw1" {
  name    = "fw1"
  network = google_compute_network.vnet1.self_link

  allow {
    protocol = "all"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["fw1"]
}

resource "google_compute_address" "pubip1" {
  name        = "pubip1"
  description = "Static public IP"
}

resource "google_compute_instance" "vm1" {
  name         = "vm1"
  machine_type = "e2-medium"
  zone         = "${var.location}-a"
  tags         = ["fw1"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vnet1.self_link
    subnetwork = google_compute_subnetwork.snet1.self_link
    access_config {
      nat_ip = google_compute_address.pubip1.address
    }
  }

  metadata_startup_script = file("./customdata.tpl")

  # usage of provisioner is a last resort or
  # can be used for simple non-destructive tasks
  # not recommended for complex operations
  # provisioner changes are not captured in terraform state
  provisioner "local-exec" {
    command = templatefile("${var.local-os}-ssh-script.tpl", {
      hostname     = self.network_interface.0.access_config.0.nat_ip,
      user         = "adminuser",
      identityfile = "~/.ssh/id_rsa"
    })
    interpreter = var.local-os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }

  labels = {
    environment = var.environment
  }
}
