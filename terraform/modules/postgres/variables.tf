variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "name_prefix"         { type = string }

variable "vnet_id"       { type = string }
variable "db_subnet_id"  { type = string }

variable "administrator_login"          { type = string }
variable "administrator_login_password" { type = string }

variable "sku_name" {
  type    = string
  default = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "high_availability" {
  type    = string
  default = "Disabled" # or "ZoneRedundant"
}

variable "tags" {
  type    = map(string)
  default = {}
}
 