// outputs the set of linux bastion instances from the linux bastion instance group
output linux_bastion_instances {
  description = "The set of linux bastion instances"
  value = tolist(data.google_compute_instance_group.linux_bastion_instance_group.instances)
}
