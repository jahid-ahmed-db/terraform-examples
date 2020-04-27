resource "aws_iam_user" "terraform" {
    name = "terraform"
    path = "/users/"

    tags  = local.automation_tags
}

resource "aws_iam_access_key" "terrform" {
    user = aws_iam_user.terraform.name
}

resource "aws_iam_group" "automation" {
    name = "tf-automation-group"
    path = "/groups/"
}

resource "aws_iam_group_membership" "automation" {
    name  = "tf-automation-group"

    users = [
        "${aws_iam_user.terraform.name}"
    ]
    
    group = aws_iam_group.automation.name
}

resource "aws_iam_group_policy" "automation" {
    name  = "automation"
    group = aws_iam_group.automation.id

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}