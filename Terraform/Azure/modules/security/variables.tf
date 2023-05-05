locals {
    location     = "eastus"
  assetname = "nanaykuna"
    environment = var.environment
    group = var.group
    network = var.network
    public = var.public
    private = var.private
  apps = format("v%s%s%s", local.assetname, var.environment, var.apps)
  web  = format("s%s%s%s", local.assetname, var.environment, var.web)
  function  = format("spes%s%s%s", local.assetname, var.environment, var.function)
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}

variable "web" {
  type        = string
  description = "The base name for every resource"
}

variable "function" {
  type        = string
  description = "The base name for every resource"
}

variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "network" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "public" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "private" {
  type        = string
  description = "The CIDR of the network VNET"
}