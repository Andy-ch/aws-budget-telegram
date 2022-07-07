provider "aws" {
  regiou = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "uwukull-tfstate"
    key    = "budget-telegram"
    region = "eu-west-1"
  }
}
