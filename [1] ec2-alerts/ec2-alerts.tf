module "ec2-alerts" {
  source = "../modules-tf/cw-ec2-alerts"
  
  for_each = var.ec2_incstance_name
  ec2_instance_name = each.key
  ec2_instance = each.value

  create_ec2_cpu = true
  create_ec2_network_in = false
  create_network_out = false
  create_status_check = true
}
