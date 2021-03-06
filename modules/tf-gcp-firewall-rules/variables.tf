variable "firewall_rule_name" {
  description = "Name of the firewall rule"
  default = "allow-bastion-ingress"
  type        = string
}

variable "shared_vpc_name" {
  type        = string
  default     = "shared-network"
  description = "Name for the shared vpc network"
}

variable "shared_networking_id" {
  type        = string
  description = "identifier for the shared_networking project."
}

variable "bastion_sa_email" {
  type        = string
  description = "Email for the proxy SA"
}