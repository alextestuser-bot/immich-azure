output "resource_group_name" {
  value = module.rg.name
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "aks_kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "postgres_fqdn" {
  value = module.postgres.fqdn
}

output "storage_account_name" {
  value = module.storage.account_name
}

output "storage_account_primary_connection_string" {
  value     = module.storage.primary_connection_string
  sensitive = true
}

output "file_share_name" {
  value = module.storage.file_share_name
}
