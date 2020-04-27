provider "aws" {
    region                  = var.aws_region
    shared_credentials_file = var.aws_credentials_file
    profile                 = var.aws_profile
    version                 = "~>2.57"
}