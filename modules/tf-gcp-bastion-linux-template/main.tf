resource "google_compute_instance_template" "bastion_linux_template" {
  project     = var.shared_bastion_id
  name        = var.template_name
  description = "This template is used to create linux bastion instance"

  instance_description = "Bastion linux instance"
  machine_type         = "n1-standard-2"

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // boot disk
  disk {
    source_image = data.google_compute_image.debian_image.self_link
  }

  network_interface {
    subnetwork = "projects/${var.shared_networking_id}/regions/${var.region}/subnetworks/${var.bastion_subnetwork_name}"
  }

  service_account {
    email  = var.bastion_sa_email
    scopes = var.scopes
  }

}

// Create instance group for the linux bastion
resource "google_compute_instance_group_manager" "linux_bastion_group" {
  project            = var.shared_bastion_id
  base_instance_name = var.instance_name
  zone               = var.region_zone

  version {
    instance_template = google_compute_instance_template.bastion_linux_template.self_link
    name              = var.template_name
  }

  target_size = 1
  name        = var.group_name

}

resource "time_sleep" "linux_wait_30_seconds" {
  depends_on = [google_compute_instance_group_manager.linux_bastion_group]

  create_duration = "80s"
}