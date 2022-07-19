resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 100"
  }

  depends_on = [
    local_file.inventory
  ]
}



resource "null_resource" "ping" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible -m ping -i ../ansible/inventory.ini nodes -u centos"
  }
}

resource "null_resource" "nginx" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory.ini nginx -u centos"
  }

  depends_on = [
    null_resource.wait
  ]
}
