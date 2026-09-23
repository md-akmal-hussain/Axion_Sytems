terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.5.0"

    }
  }
backend "azurerm" {
  resource_group_name  = "pipelinestg"
  storage_account_name = "stgnagpipeline"
  container_name       = "yaml-container"
  key                  = "dev.terraform.tfstate"
  
}

}

provider "azurerm" {
  features {}
}

