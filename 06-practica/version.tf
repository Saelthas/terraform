terraform {
  required_providers {
    azurerm={
        source = "hashicopr/azurerm"
        version = "4.54.0"
    }
    http={
        source = "hashicorp/http"
        version = "3.5.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.6.1"
    }
    
  }
}