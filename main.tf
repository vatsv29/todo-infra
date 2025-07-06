terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "5d1da8c6-c1dd-436c-b5a9-d2829de796dc"
  # Configuration options
}




resource "azurerm_resource_group" "vaibhav1" {
for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
}


resource "azurerm_storage_account" "stg" {
resource "azurerm_storage_account" "vaibhav1nitesh" {

  for_each = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.vaibhav1[each.key].name
  location                 = azurerm_resource_group.vaibhav1[each.key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = {
    environment = "Terraform"
  }

  
}

}

variable "storage_accounts" {
  type = map(object({
    name                     = string
    account_tier             = string
    account_replication_type = string
  }))
}

