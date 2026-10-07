terraform {
  required_version = "~> 1.15"

  cloud {
    organization = "tfcasimir"
    workspaces {
      name = "cliws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.9"
    }
  }
}

provider "aws" {
  region = var.region
}