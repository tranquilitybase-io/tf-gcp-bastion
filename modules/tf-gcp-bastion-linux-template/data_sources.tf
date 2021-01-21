data "google_compute_instance_group" "linux_bastion_instance_group" {
  depends_on = [time_sleep.linux_wait_30_seconds]
  self_link = google_compute_instance_group_manager.linux_bastion_group.instance_group
}