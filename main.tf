provider "aws" {
  region = var.aws_region
}

#Configuração do Terraform State
terraform {
  backend "s3" {
    bucket = "terraform-state-soat"
    key    = "sns-relatorio-hackathon/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-state-soat-locking"
    encrypt        = true
  }
}

# SNS
resource "aws_sns_topic" "sns_relatorio_hackathon" {
  name = "hackathon-relatorio-topic"
}
