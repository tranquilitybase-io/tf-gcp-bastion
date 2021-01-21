// Windows MIG
data "google_compute_image" "windows_image" {
  family  = "windows-2019"
  project = "gce-uefi-images"
}