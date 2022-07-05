resource "yandex_compute_instance" "db-count" {
 count          = var.db_count
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
   ssh-keys = "centos:${file("~/.ssh/yc.pub")}"
 }


 network_interface {
   subnet_id = yandex_vpc_subnet.subnet-count.id
   nat       = true
 }
}
