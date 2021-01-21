# SHARED VPC
variable "bastion_subnetwork_name" {
  description = "Subnetwork where bastion and proxy servers should be deployed at."
  type        = string
}

variable "region_zone" {
  type        = string
  description = "zone name in the region provided."
}

#FOLDER STRUCTURE CREATION
variable "region" {
  type        = string
  description = "region name."
}

variable "shared_bastion_id" {
  type        = string
  description = "TB Bastion ID"
}

variable "shared_networking_id" {
  type        = string
  description = "identifier for the shared_networking project."
}

variable root_id {
  type        = string
  description = "ID for the parent organisation where folders will be created"
}

variable "scopes" {
  type        = list(string)
  default     = []
  description = "A list of service scopes attached to the bootstrap terraform server. To allow full access to all Cloud APIs, use the cloud-platform scope. For other scopes see here: https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes "
}

variable "main_iam_service_account_roles" {
  type = list(string)
  default = [
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/billing.projectManager",
    "roles/compute.xpnAdmin",
    "roles/owner",
    "roles/compute.networkAdmin",
  ]
  description = "Roles attached to service account"
}

variable "private_dns_domain_name" {
  type        = string
  description = "DNS Domain name"
}

variable "private_dns_name" {
  type        = string
  description = "Name of the DNS Zone"
}

variable "windows_template_name" {
  type        = string
  default = "tb-bastion-windows-template"
  description = "Proxy Instance Template"
}

variable "windows_instance_name" {
  type        = string
  default = "tb-windows-bastion"
  description = "Base Instance Name"
}

variable "windows_group_name" {
  type        = string
  default = "tb-windows-bastion-group"
  description = "Instance Group Manager Name"
}

variable "linux_template_name" {
  type        = string
  default = "tb-bastion-linux-template"
  description = "Proxy Instance Template"
}

variable "linux_instance_name" {
  type        = string
  default = "tb-linux-bastion"
  description = "Base Instance Name"
}

variable "linux_group_name" {
  type        = string
  default = "tb-linux-bastion-group"
  description = "Instance Group Manager Name"
}

variable "sa_name" {
  type        = string
  default = "bastion-service-account"
  description = "Display name to be used for the Service Account"
}

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

variable "shared_bastion_project_number" {
  type = string
}