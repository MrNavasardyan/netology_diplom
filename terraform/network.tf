# Network
# resource "yandex_vpc_network" "network" {
#   name = "net"
# }

# resource "yandex_vpc_subnet" "subnet" {
#   name = "subnet"
#   zone           = "ru-central1-a-${terraform.workspace}"
#   network_id     = yandex_vpc_network.subnet.id
#   v4_cidr_blocks = ["192.168.101.0/24"]
# }

resource "yandex_vpc_network" "network-count" {
  name = "network-${terraform.workspace}"
}

resource "yandex_vpc_subnet" "subnet-count" {
  name           = "subnet-${terraform.workspace}"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-count.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}