module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}


module "virtual_network" {
  source = "../../modules/azurerm_virtual_network"
  vnets  = var.vnets

  depends_on = [module.resource_group]

}

module "subnet" {
  source  = "../../modules/azurerm_subnet"
  subnets = var.subnets



  depends_on = [module.virtual_network]

}

module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  pips   = var.pips

  depends_on = [module.resource_group]

}

# module "bastion_host" {
#   source = "../../modules/azurerm_bastion_host"
#   bsn    = var.bsn

#   depends_on = [module.subnet, module.public_ip]

# }

# module "postgresql_flexible_server" {
#   source = "../../modules/azurerm_postgresql_flexible_server"
#   psql   = var.psql

#   depends_on = [module.subnet]

# }

module "linux_virtual_machine" {
  source = "../../modules/azurerm_linux_virtual_machine"
  vms    = var.vms

  depends_on = [module.subnet, module.public_ip]

}

