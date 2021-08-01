// data "docker_registry_image" "node-14-slim" {
//   name = "node:14-slim"
// }

resource "null_resource" "docker" {
    provisioner "local-exec" {
    command = <<EOH
curl -fsSL https://get.docker.com/rootless | sh
DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  ~/bin/dockerd-rootless.sh \
  -H tcp://0.0.0.0:2376
EOH
  }
}


resource "docker_image" "helloworld" {
  name = "helloworld"
  force_remove = true
  keep_locally = false
  // pull_triggers = [data.docker_registry_image.node-14-slim.sha256_digest]
  build {
    path = "./service"
    tag = ["helloworld:latest"]
  }

  depends_on = [null_resource.docker]
}
