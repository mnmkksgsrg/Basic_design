terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}

provider "aws" {
  region = "ap-east-1"
  default_tags {
    tags = {
      Project = "wordpress"
      Owner   = "mnmkksgsrg"
    }
  }
}

