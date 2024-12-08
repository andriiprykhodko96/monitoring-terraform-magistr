module "s3-alerts" {
  source = "../modules-tf/cw-dynamo-alerts"

  dynamo_db = "prod-table"

  create_dynamo_req_throttled = true
  create_dynamo_conditional_check_failed = true
  create_dynamo_req_returned_item = true
  create_dynamo_system_errors = true
  create_dynamo_user_errors = true
}
