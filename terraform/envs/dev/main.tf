locals {
  name_prefix = var.prefix
}

module "rg" {
  source   = "../../modules/resource-group"
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = local.name_prefix
  tags                = var.tags  
  vnet_cidr       = "10.10.0.0/16"
  aks_subnet_cidr = "10.10.1.0/24"
  db_subnet_cidr  = "10.10.2.0/27"
}

module "aks" {
  source              = "../../modules/aks"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = local.name_prefix
  tags                = var.tags
  vnet_id            = module.network.vnet_id
  aks_subnet_id      = module.network.aks_subnet_id
  kubernetes_version = "1.30.0"
  node_count         = 1
  node_vm_size       = "Standard_D4as_v5"
}

module "postgres" {
  source              = "../../modules/postgres"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = local.name_prefix
  tags                = var.tags
  vnet_id        = module.network.vnet_id
  db_subnet_id   = module.network.db_subnet_id
  administrator_login          = "immichadmin"
  administrator_login_password = "Supersecurepassword123!@" 
  sku_name      = "GP_Standard_D2s_v3"
  storage_mb    = 32768               
  backup_retention_days = 7
  high_availability     = "Disabled"
}

module "storage" {
  source              = "../../modules/storage"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = local.name_prefix
  tags                = var.tags
  create_file_share  = true
  file_share_name    = "immichlibrary"
  file_share_quota_gb = 500
}
