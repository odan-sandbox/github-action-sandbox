workflow "New workflow" {
  on = "push"
  resolves = ["Create an issue"]
}

workflow "New workflow 1" {
  on = "push"
}

action "Create an issue" {
  uses = "JasonEtco/create-an-issue@d799688e0585cc0c5c8786832f0c468b84340ffa"
  secrets = ["GITHUB_TOKEN"]
}
