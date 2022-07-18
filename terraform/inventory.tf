resource "local_file" "inventory" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.

    [nodes:children]
    app
    gitlab
    monitoring

    [app]
    app.grachikn.ru ansible_host=${yandex_compute_instance.app.network_interface.0.nat_ip_address}

    [gitlab]
    gitlab.grachikn.ru ansible_host=${yandex_compute_instance.gitlab.network_interface.0.nat_ip_address}
    runner.grachikn.ru ansible_host=${yandex_compute_instance.runner.network_interface.0.nat_ip_address}

    [monitoring]
    monitoring.grachikn.ru ansible_host=${yandex_compute_instance.monitoring.network_interface.0.nat_ip_address}

    [db]
<<<<<<< HEAD
    db01.grachikn.ru ansible_host=${yandex_compute_instance.db-count.*.network_interface.0.ip_address}
    db02.grachikn.ru ansible_host=${yandex_compute_instance.db-count.*.network_interface.0.ip_address}
=======
    db01.grachikn.ru ansible_host=${yandex_compute_instance.db-master.network_interface.0.nat_ip_address}
    db02.grachikn.ru ansible_host=${yandex_compute_instance.db-slave.network_interface.0.nat_ip_address}
>>>>>>> 5e8450ce4a9ba075d57d9d4b4b1661bb4c95867a

    DOC
  filename = "../ansible/inventory.ini"
}
