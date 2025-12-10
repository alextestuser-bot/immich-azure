variable "location" {
  type        = string
  description = "Azure region for dev environment"
  default     = "eastasiax"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "immich-dev"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default = {
    project = "immich"
    env     = "dev"
  }
}
