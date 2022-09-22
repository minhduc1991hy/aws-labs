terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.2.5"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_iam_user" "users" {
  for_each = var.user_names
  name     = each.key
  tags     = each.value.tags
  # count = length(var.user_names) //Dòng này để lặp qua từng phần tử của list
  # name  = var.user_names[count.index]
}