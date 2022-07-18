resource "yandex_compute_instance" "monitoring" {
 name = "monitoring"
 hostname ="monitoring.${var.my_domain}"

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


 network_interface {
   subnet_id = yandex_vpc_subnet.mysubnet_1.id
   nat       = true
 }
}
