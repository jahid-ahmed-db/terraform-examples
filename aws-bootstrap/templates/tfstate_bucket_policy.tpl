{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ListBucket",
      "Action": [
          "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${s3_bucket}",
      "Principal": {
          "AWS" : "${automation_user_arn}"
      }
    },
    {
      "Sid": "GetPutObject",
      "Action": [
          "s3:GetObject",
          "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${s3_bucket}/${tfstate_file}",
      "Principal": {
          "AWS" : "${automation_user_arn}"
      }
    }
  ]
}
