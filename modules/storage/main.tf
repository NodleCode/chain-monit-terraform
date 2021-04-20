resource "google_storage_bucket" "artifacts_bucket" {
  name = "nofal-nodle-artifacts"
}

resource "google_storage_bucket_access_control" "artifacts_public_rule" {
  bucket = google_storage_bucket.artifacts_bucket.name
  role   = "READER"
  entity = "allUsers"
}


