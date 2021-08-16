# ----
# Terraform configuration
# ----
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
  backend "s3" {
    bucket  = "tastylog-tfstate-bucket-himorishige"
    key     = "tastylog-dev.tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}

# ----
# Provider
# ----
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

provider "aws" {
  alias   = "virginia"
  profile = "terraform"
  region  = "us-east-1"
}

# ----
# Variables
# ----
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}
