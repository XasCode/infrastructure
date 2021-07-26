output "path" {
  description = "The path of this project."
  value = module.project.path
}

output "name" {
  description = "The name of the project."
  value = module.project.name
}

output "id" {
  description = "The project_id."
  value = module.project.id
}

output "number" {
  description = "The project number."
  value = module.project.number
}
