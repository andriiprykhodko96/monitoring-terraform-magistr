# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example" {
  count                   = 2
  vpc_id                  = aws_vpc.example.id
  cidr_block              = cidrsubnet(aws_vpc.example.cidr_block, 8, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "example-subnet-${count.index}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_elasticache_subnet_group" "example" {
  name       = "example-elasticache-subnet-group"
  subnet_ids = aws_subnet.example[*].id

  tags = {
    Name = "example-elasticache-subnet-group"
  }
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = "prod-elasticache"
  engine               = "redis" # Use "memcached" if you want Memcached
  node_type            = "cache.t2.micro" # Free-tier eligible
  num_cache_nodes      = 1 # Single node for free-tier eligibility
  parameter_group_name = "default.redis7" # Default Redis parameter group
  subnet_group_name    = aws_elasticache_subnet_group.example.name

  tags = {
    Name = "prod-elasticache"
  }
}