terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Here I specify profile as default as I am using aws-cli for authentication and authorization
provider "aws" {
  region  = var.region
  profile = "default"
}