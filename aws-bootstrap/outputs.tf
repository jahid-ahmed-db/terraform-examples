resource "local_file" "aws_keys" {
    filename          = "terraform_credentials"
    file_permission   = "0400"

    sensitive_content = <<EOF
[terraform]
aws_access_key_id = "${aws_iam_access_key.terrform.id}"
aws_secret_access_key = "${aws_iam_access_key.terrform.secret}"
EOF

}

resource "local_file" "terraform_backend" {
    filename          = "terraform_backend"
    file_permission   = "0400"

    content           =<<EOF
terraform {
    backend "s3" {
        bucket         = "${aws_s3_bucket.tfstate.id}"
        key            = "${var.terraform_state_file}"
        region         = "${var.aws_region}"
        dynamodb_table = "${var.aws_dynamodb_table}"
    }
}
EOF

}