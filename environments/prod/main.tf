module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "storage_account" {
  source = "../../child_module/azurerm_storage_account"
  strgs  = var.storage_accounts

  depends_on = [module.resource_group]

}

module "virtual_network" {
  source = "../../child_module/azurerm_virtual_network"
  vnets  = var.virtual_networks

  depends_on = [module.resource_group]

}

module "subnet" {
  source  = "../../child_module/azurerm_subnet"
  subnets = var.azure_subnets



  depends_on = [module.resource_group, module.virtual_network]

}

module "public_ip" {
  source = "../../child_module/azurerm_public_ip"
  pips   = var.public_ips

  depends_on = [module.resource_group]

}

module "Azure_Bastion" {
  source     = "../../child_module/azurerm_bastion_host"
  bastion    = var.azure_bastion
  subnet_ids = module.subnet.subnet_ids
  pip_ids    = module.public_ip.pip_ids

  depends_on = [module.resource_group, module.subnet, module.public_ip]


}