resource "aws_dynamodb_table" "basic-table" {
  name = "${var.name}"
  hash_key = "${var.hash_key}"
}
