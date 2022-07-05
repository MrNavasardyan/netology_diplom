resource "yandex_compute_instance" "vm-count" {
 count          = var.vm_count
 name = "db-${count.index}-${terraform.workspace}"

 resources {
       cores = "2"
       memory = "2"
 }

 boot_disk {
   initialize_params {
     image_id = "fd8sgdi3n1kbkn8n5hql"
   }
 }

   metadata = {
   ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
 }


 network_interface {
   subnet_id = yandex_vpc_subnet.subnet.id
   nat       = true
 }
}

output "internal_ip_address_vm_instance_db" {
  value = yandex_compute_instance.vm-count.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_db" {
  value = yandex_compute_instance.vm-count.*.network_interface.0.nat_ip_address
}