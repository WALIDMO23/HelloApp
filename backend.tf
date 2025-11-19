terraform {
  backend "s3" {
    bucket       = "welo-s3-bucket"
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
