data "google_compute_instance" "vm1-data" {
  name = google_compute_instance.vm1.name
  zone = google_compute_instance.vm1.zone
}
