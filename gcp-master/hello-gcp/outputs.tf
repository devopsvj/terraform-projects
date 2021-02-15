output "mig_self_link" {
  description = "Self link for mig"
  value       = module.mig.self_link
}

output "mig_instance_group_url" {
  description = "Url for mig instance group"
  value       = module.mig.instance_group
}

output "instance_template_self_link" {
  description = "Self link for instance template"
  value       = module.instance_template.self_link
}

output "instance_tempalte_name" {
  description = "Instance template name"
  value       = module.instance_template.name
}

#output "webserver_ip" {
#  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
#}

output "backend_services" {
  description = "The backend service resources."
  value       = module.gce-lb-http.backend_services
}

output "load_balancer_external_ip" {
  description = "The external ip address of the forwarding rule for default lb."
  value       = module.gce-lb-http.external_ip
}
