terraform {
  required_version = "~>1.5.5"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "value"

    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"

}


