// Gets the windows bastion instance group from the windows bastion instance group manager
data "google_compute_instance_group" "windows_bastion_instance_group" {
  depends_on = [time_sleep.windows_wait_30_seconds]
  self_link = google_compute_instance_group_manager.windows_bastion_group.instance_group
}