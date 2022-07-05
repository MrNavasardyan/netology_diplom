terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  #backend "s3" {
   #  endpoint   = "storage.yandexcloud.net"
    # bucket     = "tf-state-bucket-gnavasardyan"
     #region     = "ru-central1-a"
     #key        = "terraform/infrastructure1/terraform.tfstate"
     #access_key = "YCAJEPie5HNBklZlGOmrxRkY6"
     #secret_key = "YCNP8puzHOBgiyOg1AYRGzWEhS71m1oxoksO2-yv"

     #skip_region_validation      = true
     #skip_credentials_validation = true
  #}
}

provider "yandex" {
  token     = var.token_auth
  cloud_id  = var.cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.zone
}

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
   subnet_id = yandex_vpc_subnet.subnet-count.id
   nat       = true
 }
}

output "internal_ip_address_vm_instance_db" {
  value = yandex_compute_instance.vm-count.*.network_interface.0.ip_address
}

output "external_ip_address_vm_instance_db" {
  value = yandex_compute_instance.vm-count.*.network_interface.0.nat_ip_address
}