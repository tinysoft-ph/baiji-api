provider "aws" {
  region = "us-east-1"
}

module "sites_table" {
  source = "../base/dynamo"
  name = "sites"
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
}

module "get_site_api" {
  source = "../base/apigateway"
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  resource_id = "${aws_api_gateway_resource.sites.id}"
}

module "create_sites_api" {
  source = "../base/apigateway"
  rest_api_id = "${aws_api_gateway_rest_api.baiji-test.id}"
  resource_id = "${aws_api_gateway_resource.sites.id}"
}
