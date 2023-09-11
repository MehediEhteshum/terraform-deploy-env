output "public-ip-address" {
  value = "${data.google_compute_instance.vm1-data.name} : ${data.google_compute_instance.vm1-data.network_interface.0.access_config.0.nat_ip}"
}
