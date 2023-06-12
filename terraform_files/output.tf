# output "subnet_info" {
#   value = module.vnet_deployment.subnet_id.id
# }
output "public_ip_address" {
  value = module.vm_deployment.public_ip_value
}