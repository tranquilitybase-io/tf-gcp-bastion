module "firewall_rules" {
  source = "./modules/tf-gcp-firewall-rules"
  bastion_sa_email = module.service_account.bastion_sa_email
  shared_networking_id = var.shared_networking_id
  depends_on = [module.service_account]
}

module "service_account" {
  source = "./modules/tf-gcp-service-account"
  main_iam_service_account_roles = var.main_iam_service_account_roles
  root_id = var.root_id
  sa_name = var.sa_name
  shared_bastion_id = var.shared_bastion_id
}

module "bastion_linux" {
  source = "./modules/tf-gcp-bastion-linux-template"
  bastion_sa_email = module.service_account.bastion_sa_email
  bastion_subnetwork_name = var.bastion_subnetwork_name
  group_name = var.linux_group_name
  instance_name = var.linux_instance_name
  region = var.region
  region_zone = var.region_zone
  scopes = var.scopes
  shared_bastion_id = var.shared_bastion_id
  shared_networking_id = var.shared_networking_id
  template_name = var.linux_template_name
  depends_on = [module.service_account, module.attach_bastion]
}

module "bastion_windows" {
  source = "./modules/tf-gcp-bastion-windows-template"
  bastion_sa_email = module.service_account.bastion_sa_email
  bastion_subnetwork_name = var.bastion_subnetwork_name
  group_name = var.windows_group_name
  instance_name = var.windows_instance_name
  region = var.region
  region_zone = var.region_zone
  scopes = var.scopes
  shared_bastion_id = var.shared_bastion_id
  shared_networking_id = var.shared_networking_id
  template_name = var.windows_template_name
  depends_on = [module.service_account, module.attach_bastion]
}

module "attach_bastion" {
  source = "./modules/tf-gcp-attach-bastion"
  bastion_sa_email = module.service_account.bastion_sa_email
  bastion_subnetwork_name = var.bastion_subnetwork_name
  shared_bastion_id = var.shared_bastion_id
  shared_bastion_project_number = var.shared_bastion_project_number
  shared_networking_id = var.shared_networking_id
  depends_on = [module.service_account]
}

module "windows_bastion_dns" {
  source = "./modules/tf-gcp-windows-bastion-dns"
  private_dns_domain_name = var.private_dns_domain_name
  private_dns_name = var.private_dns_name
  shared_networking = var.shared_networking_id
  windows_instances = module.bastion_windows.windows_bastion_instances
  zone = var.region_zone
}

module "linux_bastion_dns" {
  source = "./modules/tf-gcp-linux-bastion-dns"
  linux_instances = module.bastion_linux.linux_bastion_instances
  private_dns_domain_name = var.private_dns_domain_name
  private_dns_name = var.private_dns_name
  shared_networking = var.shared_networking_id
  zone = var.region_zone
}
