resource "yandex_compute_instance" "gitlab" {
 name = "gitlab"
 hostname ="gitlab.${var.my_domain}"

 resources {
       cores = "4"
       memory = "4"
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
