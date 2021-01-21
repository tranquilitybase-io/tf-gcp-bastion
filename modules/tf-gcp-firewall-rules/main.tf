resource "google_compute_firewall" "allow_bastion_ingress" {
  name    = var.firewall_rule_name
  network = var.shared_vpc_name
  project = var.shared_networking_id

  allow {
    protocol = "tcp"
  }

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  source_service_accounts = [
    var.bastion_sa_email
  ]
}