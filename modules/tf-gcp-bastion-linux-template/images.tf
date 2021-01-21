data "google_compute_image" "debian_image" {
  family  = "debian-9"
  project = "debian-cloud"
}