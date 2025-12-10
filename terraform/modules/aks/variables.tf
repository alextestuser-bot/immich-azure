variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "name_prefix"         { type = string }

variable "vnet_id"        { type = string }
variable "aks_subnet_id"  { type = string }

variable "kubernetes_version" {
  type    = string
  default = "1.30.0"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D4as_v5"
}

variable "tags" {
  type    = map(string)
  default = {}
}
