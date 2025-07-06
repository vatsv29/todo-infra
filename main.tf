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
