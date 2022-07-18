variable "yandex_cloud_id" {
  default = "b1ga39ackif6hoe1jml8"
}


variable "yandex_folder_id" {
  default = "b1g44aeklt0923vqtp97"
}


variable "centos-7-base" {
  default = "fd8nqvct7t8a9t8c0it6"
}


variable "zone" {
  type        = string
  default     = "ru-central1-a"
}


variable "db_count" {
  description = "Number of Virtual DB Machines"
  default     = 2
  type        = string
}

variable "my_domain" {
  default = "grachikn"
  description = "Name for VM"
  type        = string
}
