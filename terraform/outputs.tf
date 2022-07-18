
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

output "internal_ip_address_vm_instance_app" {
  value = yandex_compute_instance.app.grachikn.ru.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_app" {
  value = yandex_compute_instance.app.grachikn.ru.*.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_instance_runner" {
  value = yandex_compute_instance.runner.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_runner" {
  value = yandex_compute_instance.runner.*.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_instance_gitlab" {
  value = yandex_compute_instance.gitlab.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_gitlab" {
  value = yandex_compute_instance.gitlab.*.network_interface.0.nat_ip_address
}