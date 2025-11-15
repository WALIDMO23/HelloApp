terraform {
  backend "s3" {
    bucket       = "walidmo-devops-project-repo"
    key          = "eks/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}

