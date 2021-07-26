/*
data "archive_file" "srcfiles" {
  count        = contains(var.envs, var.environment) ? 1 : 0

  type        = "zip"
  output_path = "api.zip"
  source_dir  = "./src"
}
*/