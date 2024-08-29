resource "google_storage_bucket_iam_binding" "export_role_binding" {
  bucket  = var.gcs_bucket
  role    = "roles/storage.objectAdmin"
  members = ["serviceAccount:${var.stitcher_ai_sa}"]

  condition {
    expression = "resource.name.startsWith(\"projects/_/buckets/${var.gcs_bucket}/objects/${var.gcs_path}\")"
    title      = "${var.stitcher_ai_sa} restricts access to base_path for data export role"
  }
}
