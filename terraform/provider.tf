# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  }


# backend "s3" {
#     endpoint   = "storage.yandexcloud.net"
#     bucket     = "tf-state-bucket-diplom"
#     region     = "ru-central1"
#     key        = "terraform.tfstate.d/stage/terraform.tfstate"
#     access_key = "YCAJEu1pkTKYffW707qbyKlvQ"
#     secret_key = "YCNeV0p9LftLPNvjV-0PDH44thPB9OgQDFlNPp4q"

#     skip_region_validation      = true
#     skip_credentials_validation = true
#   }

resource "yandex_storage_bucket" "test" {
  access_key = "YCAJEu1pkTKYffW707qbyKlvQ"
  secret_key = "YCNeV0p9LftLPNvjV-0PDH44thPB9OgQDFlNPp4q"
  bucket = "my-test-bucket"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone = "${var.zone}"
}



# access_key:
#   id: ajejd937kgbjepe2o5ga
#   service_account_id: ajej7rfe81jr4jphc22m
#   created_at: "2022-07-12T11:00:53.894700072Z"
#   key_id: YCAJEu1pkTKYffW707qbyKlvQ
# secret: YCNeV0p9LftLPNvjV-0PDH44thPB9OgQDFlNPp4q
