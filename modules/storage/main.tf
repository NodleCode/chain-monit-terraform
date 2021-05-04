resource "google_storage_bucket" "artifacts_bucket" {
  name = "nodle-chain-artifacts"
}

resource "google_storage_bucket_iam_binding" "artifacts_public_rule" {
  bucket = google_storage_bucket.artifacts_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

