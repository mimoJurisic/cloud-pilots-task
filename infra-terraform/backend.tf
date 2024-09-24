# bucket for state file
resource "google_storage_bucket" "tf_state" {
  name                        = "TERRAFORM_STATE_DEMO_CLOUD_PILOTS"
  location                    = "EUROPE"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
terraform {
  backend "gcs" {
    bucket = "TERRAFORM_STATE_DEMO_CLOUD_PILOTS"
    prefix = "terraform-state"

  }
}