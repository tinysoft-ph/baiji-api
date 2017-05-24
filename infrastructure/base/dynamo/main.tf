resource "aws_dynamodb_table" "basic-table" {
  name = "${var.name}"
  hash_key = "${var.hash_key}"
  read_capacity = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  attribute {
  	name = "${var.hash_key}"
	type = "S"
  }
}
