terraform {
  backend "s3" {
    bucket         = "teraremote"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "teradynamo"

  }
}