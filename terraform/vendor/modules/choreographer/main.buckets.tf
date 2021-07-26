/*
resource "google_storage_bucket" "bucket" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  name = "choreographer-bucket-${random_id.random.hex}"
  project = module.project.id
}

resource "google_storage_bucket_object" "archive" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  name   = "index-${filemd5(data.archive_file.srcfiles[count.index].output_path)}.zip"
  bucket = google_storage_bucket.bucket[count.index].name
  source = data.archive_file.srcfiles[count.index].output_path
}
*/