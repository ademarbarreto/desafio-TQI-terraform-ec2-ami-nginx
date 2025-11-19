terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
  # As credenciais podem vir das variáveis de ambiente AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY
}