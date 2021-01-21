// outputs the set of windows bastion instances from the windows bastion instance group
output windows_bastion_instances {
  description = "The set of windows bastion instances"
  value = tolist(data.google_compute_instance_group.windows_bastion_instance_group.instances)
}