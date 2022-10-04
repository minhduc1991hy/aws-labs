/*terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.2.5"
}*/

terraform {
  cloud {
    organization = "aws04"

    workspaces {
      name = "aws04"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
