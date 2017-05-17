provider "aws" {
  region = "us-east-1"
}

module "sites_table" {
  source = "../base/dynamo"
  name = "sites"
}

module "get_sites_api" {
  source = "../base/apigateway"
}

module "create_sites_api" {
  source = "../base/apigateway"
}
