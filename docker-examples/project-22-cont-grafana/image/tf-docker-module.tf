# First Docker Image Resource
resource "docker_image" "container_image" {
  name = var.image_in
}