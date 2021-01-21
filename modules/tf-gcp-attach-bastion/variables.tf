variable "shared_networking_id" {
  type        = string
  description = "identifier for the shared_networking project."
}

variable "shared_bastion_id" {
  type        = string
  description = "TB Bastion ID"
}

variable "bastion_sa_email" {
  type        = string
  description = "Email for the proxy SA"
}

variable "bastion_subnetwork_name" {
  description = "Subnetwork where bastion and proxy servers should be deployed at."
  type        = string
}

variable "shared_bastion_project_number" {
  type = string
}
