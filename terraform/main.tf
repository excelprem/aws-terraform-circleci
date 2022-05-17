terraform {
    backend "s3" {
        bucket = "prem-tfstate"
        key = "tf-circle-ecr"
        region = "us-west-2"
    }
    required_providers {
        aws = {
            source = "aws"
            version = "4.9.0"
        }
        circleci = {
            source = "mrolla/circleci"
            version = "0.4.0"
        }

    }
}

provider "aws" {
    region = var.region
}

provider "circleci" {
    api_token = var.circleci_cli_token
    organization = var.organization
}