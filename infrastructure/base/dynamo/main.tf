variable "name" {}


resource "aws_dynamodb_table" "basic-table" {
  name = "${var.name}"
}
