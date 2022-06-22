terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.26.1"
    }
  }
}

provider "github" {
  token = ""
}

resource "github_repository" "demoforterraform" {
  name        = "demoforterraform"
  description = "My awesome codebase"
  visibility  = "private"
}
