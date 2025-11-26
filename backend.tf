terraform {
  backend "s3" {
    bucket       = "welo-bucket-demotraining"
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
