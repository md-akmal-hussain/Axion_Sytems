resource_groups = {
  rg1 = {
    name     = "rg-007-prod"
    location = "Central India"
  }
}

storage_accounts = {
  stg1 = {
    name                     = "strg007prod"
    resource_group_name      = "rg-007-prod"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-007-prod"
    resource_group_name = "rg-007-prod"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]

  }
}

azure_subnets = {
  subnet1 = {
    name                 = "subnet-007-prod"
    resource_group_name  = "rg-007-prod"
    virtual_network_name = "vnet-007-prod"
    address_prefixes     = ["10.0.1.0/24"]

  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-007-prod"
    virtual_network_name = "vnet-007-prod"
    address_prefixes     = ["10.0.2.0/26"]

  }
}

public_ips = {
  pip1 = {
    name                = "Bastion_IP"
    resource_group_name = "rg-007-prod"
    location            = "Central India"
    allocation_method   = "Static"

  }
}
azure_bastion = {
  bsn1 = {

    name                = "AzureBastion"
    resource_group_name = "rg-007-prod"
    location            = "Central India"
    subnet_key = "subnet2"
      pip_key    = "pip1"

    ip_configuration = {
      name       = "Bastion_IP"
      

    }
  }
}