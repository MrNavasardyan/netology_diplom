
output "internal_ip_address_vm_instance_my-domain" {
  value = yandex_compute_instance.my-domain.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_my-domain" {
  value = yandex_compute_instance.my-domain.*.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_instance_db_slave" {
  value = yandex_compute_instance.db-slave.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_db_slave" {
  value = yandex_compute_instance.db-slave.network_interface.0.nat_ip_address
}


output "internal_ip_address_vm_instance_db_master" {
  value = yandex_compute_instance.db-master.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_db_master" {
  value = yandex_compute_instance.db-master.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_instance_app" {
  value = yandex_compute_instance.app.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_app" {
  value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
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

output "internal_ip_address_vm_instance_monitoring" {
  value = yandex_compute_instance.monitoring.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_monitoring" {
  value = yandex_compute_instance.monitoring.*.network_interface.0.nat_ip_address
}