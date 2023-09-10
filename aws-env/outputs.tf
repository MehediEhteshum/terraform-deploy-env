output "public-ip-address" {
  value = "${data.aws_instance.vm1-data.id}: ${data.aws_instance.vm1-data.public_ip}"
}
