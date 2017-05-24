variable "account_id" {
  default = "123123123"
}

variable "region" {
  default = "us-east-1"
}

variable "environment" {
  default = "test"
}

provider "aws" {
  region = "${var.region}"
}

module "sites_table" {
  source = "../base/dynamo"
  name = "sites"
  hash_key = "site_id"
  read_capacity = "10"
  write_capacity = "10"
}

resource "aws_api_gateway_rest_api" "baiji-test" {
  name = "baiji-test"
  description = "This is the baiji test api"
}

resource "aws_api_gateway_resource" "sites" {
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  parent_id = "${aws_api_gateway_rest_api.baiji-test.root_resource_id}"
  path_part = "sites"
}

module "get_sites_api" {
  source = "../base/apigateway"
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  resource_id = "${aws_api_gateway_resource.sites.id}"
  http_method = "GET"
  account_id = "${var.account_id}"
  region = "${var.region}"
  lambda_name = "get_sites_api-${var.environment}"
}

module "get_site_api" {
  source = "../base/apigateway"
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  resource_id = "${aws_api_gateway_resource.sites.id}"
  http_method = "GET"
  account_id = "${var.account_id}"
  region = "${var.region}"
  lambda_name = "get_site_api-${var.environment}"
}

module "create_sites_api" {
  source = "../base/apigateway"
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  resource_id = "${aws_api_gateway_resource.sites.id}"
  http_method = "POST"
  account_id = "${var.account_id}"
  region = "${var.region}"
  lambda_name = "create_sites_api-${var.environment}"
}
