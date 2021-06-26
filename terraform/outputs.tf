output "projects" {
  value = flatten(flatten(
    module.corp.projects,
    module.mkting.projects),
    module.randd.projects
  )
}
