variable "aws_region" {
    description = "AWS region to deploy infrastructure."
}

variable "aws_terraform_bucket" {
    description = "AWS s3 bucket to store Terraform state file remotely."
}

variable "terraform_state_file" {
    description = "Terraform state file."
    default     = "terraform.tfstate"
}

variable "aws_dynamodb_table" {
    description = "AWS DynamoDB table for Terraform state lock."
}