resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 100"
  }

  depends_on = [
    local_file.inventory
  ]
}

# resource "null_resource" "ping" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible all -m ping -u centos"
#   }

#   depends_on = [
#     null_resource.wait
#   ]
# }

resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook ../ansible/playbook.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}
