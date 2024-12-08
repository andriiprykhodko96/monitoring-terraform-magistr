resource "aws_dynamodb_table" "prod-table" {
  name           = "prod-table"
  billing_mode   = "PAY_PER_REQUEST" # Use "PROVISIONED" for manually setting read/write capacity

  hash_key       = "id" # Partition key
  attribute {
    name = "id"
    type = "S" # String type (options: S - String, N - Number, B - Binary)
  }
}