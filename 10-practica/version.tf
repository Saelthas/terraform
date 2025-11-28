terraform {
  # backend "azurerm" {

  #   resource_group_name  = "rg-tf-state-rAruzamen"
  #   storage_account_name = "sacstate88383"
  #   container_name       = "tfstate"
  #   key                  = "cloud/terraform.tfstate"
  # }
  backend "remote" {

    hostname = "app.terraform.io"
    organization = "raruzamen"
    workspaces {
      name = "dev"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}