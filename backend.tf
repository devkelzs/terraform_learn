terraform {
  backend "s3" {
    bucket         = "kelly-tf-project1-2026"   
    key            = "project1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"         
  }
}
