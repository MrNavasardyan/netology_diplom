resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 100"
  }

  depends_on = [
    local_file.inventory
  ]
}

# resource "null_resource" "nginx" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_FORCE_COLOR=1 ansible all -i ../ansible/inventory.ini -m ping"
#   }


#   depends_on = [
#     null_resource.wait
#   ]
# }