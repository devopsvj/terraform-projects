
output "application_access" {
    value = [for x in module.container[*]: x]
    description = "the name and socker for each application"
}
