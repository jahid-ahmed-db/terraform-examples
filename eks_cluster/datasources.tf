locals {
    automation_tags = {
        created_by  = "Terraform Automation"
        environmnet = "Development"
    }
}

data "template_file" "terraform_bucket_policy" {
    template = file("templates/tfstate_bucket_policy.tpl")

    vars     = {
        automation_user_arn = aws_iam_user.terraform.arn
        s3_bucket           = var.aws_terraform_bucket
        tfstate_file        = var.terraform_state_file
    }
}