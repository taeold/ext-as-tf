resource "google_cloudfunctions_function" "function" {
  name    = "generateResizedImage"
  runtime = "nodejs10"
  region  = var.location

  available_memory_mb   = 1024
  source_archive_bucket = "firebase-mod-sources-prod"
  source_archive_object = "bf9201dd4c8c505b66832edfed84b86b5ec290508e32bf0217790b8c7a6ed4bd"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = "projects/_/buckets/${var.img_bucket}"
  }

  entry_point = "generateResizedImage"
  environment_variables = {
    LOCATION             = var.location
    IMG_BUCKET           = var.img_bucket
    IMG_SIZES            = var.img_sizes
    DELETE_ORIGINAL_FILE = var.delete_original_file
    RESIZED_IMAGES_PATH  = var.resized_images_path
    CACHE_CONTROL_HEADER = var.cache_control_header
    IMAGE_TYPE           = var.image_type
  }

  service_account_email = google_service_account.sa.email

  depends_on = [
    google_service_account.sa,
    google_project_service.iam,
    google_project_service.firebase,
    google_project_service.cloudfunctions,
  ]
}
