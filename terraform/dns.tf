locals {
  managed_zone_project_id = data.terraform_remote_state.root.outputs.project_id
  managed_zone_dns_name   = data.terraform_remote_state.root.outputs.managed_zone_animeshon_com_dns_name
  managed_zone_name       = data.terraform_remote_state.root.outputs.managed_zone_animeshon_com_name
}

# Setup developers subdomain managed by Google Cloud Run.
resource "google_dns_record_set" "developers" {
  project = local.managed_zone_project_id

  name         = "developers.${local.managed_zone_dns_name}"
  managed_zone = local.managed_zone_name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["ghs.googlehosted.com."]
}
