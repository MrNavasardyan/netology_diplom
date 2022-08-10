# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
 

backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket-nav"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEu1pkTKYffW707qbyKlvQ"
    secret_key = "YCNeV0p9LftLPNvjV-0PDH44thPB9OgQDFlNPp4q"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
 }

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone = "${var.zone}"
}
