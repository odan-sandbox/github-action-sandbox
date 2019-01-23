workflow "New workflow" {
  on = "push"
  resolves = ["Create an issue"]
}

action "Create an issue" {
  uses = "JasonEtco/create-an-issue@d799688e0585cc0c5c8786832f0c468b84340ffa"
  secrets = ["GITHUB_TOKEN"]
}

workflow "New workflow 1" {
  resolves = ["GitHub Action for npm"]
  on = "push"
}

action "GitHub Action for npm" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -t odanado/github-action-sandbox ."
}
