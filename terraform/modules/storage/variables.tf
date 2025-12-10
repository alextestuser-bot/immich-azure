variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "name_prefix"         { type = string }

variable "create_file_share" {
  type    = bool
  default = false
}

variable "file_share_name" {
  type    = string
  default = "immichlibrary"
}

variable "file_share_quota_gb" {
  type    = number
  default = 500
}

variable "tags" {
  type    = map(string)
  default = {}
}
