resource "yandex_compute_instance" "db-count" {
 count          = var.db_count
 name = "db-${count.index}"

 resources {
       cores = "2"
       memory = "2"
 }

 boot_disk {
   initialize_params {
     image_id = "fd8nqvct7t8a9t8c0it6"
   }
 }

   metadata = {
   ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
 }
      # metadata = {
      #     user-data = "${file("./meta.yml")}"
      #   }

 network_interface {
   subnet_id = yandex_vpc_subnet.subnet-count.id
   nat       = true
 }
}
