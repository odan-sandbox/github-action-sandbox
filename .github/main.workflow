action "Create an issue" {
  uses = "JasonEtco/create-an-issue@d799688e0585cc0c5c8786832f0c468b84340ffa"
  secrets = ["GITHUB_TOKEN"]
}

action "GitHub Action for npm" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -t odanado/github-action-sandbox ."
}

action "docker" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["GitHub Action for npm"]
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["docker"]
  args = "push odanado/github-action-sandbox"
}

workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker-1"]
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "run --rm -it ubuntu bash -c \"lscpu && free -h && uname -a\""
}
