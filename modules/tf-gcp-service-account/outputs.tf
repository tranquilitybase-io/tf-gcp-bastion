output bastion_sa_email {
  description = "Email Address of the Bastion Service Account"
  value = google_service_account.bastion_service_account.email
}