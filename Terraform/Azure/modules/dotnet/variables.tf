variable "key"         { type = string }
variable "app"         { type = string }
variable "plan"        { type = string }
variable "group"       { type = string }
variable "connection"  { type = string }
variable "environment" { type = string }
variable "aspnetcore"  { type = string }
variable "public"      { type = string } # SUBNET.


locals {
  days        = 2
  priority    = 1
  length      = 50
  extension   = "~3"
  efunctions  = "~4"
  always      = true
  dotnet      = "6.0"
  file        = "File"
  action      = "Deny"
  override    = "#&%^|"
  profile     = "1.0.0"
  key         = var.key
  location    = "eastus"
  plan        = var.plan
  vnode       = "16-lts"
  group       = var.group
  portal      = "ASP.NET"
  feature     = "disabled"
  runtime     = "dotnet"
  ip          = "0.0.0.0/0"
  created     = "terraform"
  assetname   = "nanaykuna"
  recommended = "recommended"
  tz          = "America/Lima"
  aspnetcore  = var.aspnetcore
  connection  = var.connection
  environment = var.environment
  rule        = "Block Access Public"
  public      = var.public    # ID PUBLIC SUBNET.
  subresource = "sites"       # PSC subresource names.
  manual      = "false"       # ENABLE PRIVATE LINK ENDPOINT.
  net         = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.app)
}
