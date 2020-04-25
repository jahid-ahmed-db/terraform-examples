terraform {
    backend "s3" {
        bucket         = "naughtrobot-twitch-tf"
        key            = "terraform.tfstate"
        region         = "us-west-2"
        dynamodb_table = "tfstatelock"
    }
}
