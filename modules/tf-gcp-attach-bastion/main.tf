# Adding bastion project as service project to host vpc
resource "google_compute_shared_vpc_service_project" "attach_bastion_project" {
  host_project    = var.shared_networking_id
  service_project = var.shared_bastion_id
}

resource "google_compute_subnetwork_iam_binding" "bastion_subnet_permission" {
  subnetwork = var.bastion_subnetwork_name
  role       = "roles/compute.networkUser"
  project    = var.shared_networking_id

  members = [
    "serviceAccount:${var.bastion_sa_email}",
    "serviceAccount:${var.shared_bastion_project_number}@cloudservices.gserviceaccount.com"
  ]
}