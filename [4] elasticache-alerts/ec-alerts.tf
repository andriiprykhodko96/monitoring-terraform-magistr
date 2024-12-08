module "ec-alerts" {
  source = "../modules-tf/cw-ec-alerts"
  elasticache_db = "prod-elasticache"

  create_ec_cpu = true
  create_ec_authentication_failures = true
  create_ec_curr_connections = true
  create_ec_engine_cpu = true
  create_ec_network_bytes_in = true
  create_ec_network_bytes_out = true
  create_ec_evictions = true
  create_ec_new_connections = true
}

