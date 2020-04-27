resource "aws_s3_bucket" "tfstate" {
    bucket        = var.aws_terraform_bucket
    acl           = "private"
    force_destroy = true

    versioning {
        enabled = true
    }

    policy = data.template_file.terraform_bucket_policy.rendered
}

resource "aws_dynamodb_table" "terraform_statelock" {
    name           = var.aws_dynamodb_table
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}