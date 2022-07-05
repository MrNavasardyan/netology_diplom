# Network
resource "yandex_vpc_network" "network" {
  name = "net"
}

resource "yandex_vpc_subnet" "subnet" {
  name = "subnet"
  zone           = "ru-central1-a"
  network_id     = "$yandex_vpc_network.subnet.id"
  v4_cidr_blocks = ["192.168.101.0/24"]
}
