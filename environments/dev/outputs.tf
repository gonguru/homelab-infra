output "namespace" {
  value = module.app_namespace.name
}

output "sample_app_status" {
  value = helm_release.sample_app.status
}
