
output "internal_ip_address_vm_instance_my-domain" {
  value = yandex_compute_instance.my-domain.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_my-domain" {
  value = yandex_compute_instance.my-domain.*.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_instance_db" {
  value = yandex_compute_instance.db-count.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_db" {
  value = yandex_compute_instance.db-count.*.network_interface.0.nat_ip_address
}