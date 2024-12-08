terraform {
  required_version = ">= 1.3.9"
  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = ">= 3.15.5"
    }
  }
}

provider "pagerduty" {
  token = "u+Fk_ywkJCAF-P_Am-RQ"
}

provider "aws" {
  region = "us-east-1"
}