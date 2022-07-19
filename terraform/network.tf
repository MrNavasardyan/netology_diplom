resource "yandex_vpc_network" "network" {
  name = "network-${terraform.workspace}"
}

resource "yandex_vpc_subnet" "mysubnet_1" {
  name           = "subnet-${terraform.workspace}"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "mysubnet_2" {
  name           = "subnet2-${terraform.workspace}"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.11.0/24"]
}

resource "yandex_dns_zone" "zone1" {
  name        = "my-private-zone"
  description = "desc"

  labels = {
    label1 = "label-1-value"
  }

  zone             = "grachikn.ru."
  public           = true
  private_networks = [yandex_vpc_network.network.id]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "http://www.grachikn.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.my-domain.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "http://gitlab.grachikn.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.gitlab.network_interface.0.nat_ip_address}"]
}