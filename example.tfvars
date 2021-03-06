# AWS region where should the AWS Kubernetes be deployed
aws_region    = "eu-central-1"

# Name for AWS resources
cluster_name  = "aws-kubernetes"

# Instance types for mster and worker nodes
master_instance_type = "t2.medium"
worker_instance_type = "t2.medium"

# SSH key for the machines
ssh_public_key = "~/.ssh/id_rsa.pub"

# Subnet IDs where the cluster should run (should belong to the same VPC)
# - Master can be only in single subnet
# - Workers can be in multiple subnets
# - Worker subnets can contain also the master subnet
# - If you want to run workers in different subnet(s) than master you have to tag the subnets with kubernetes.io/cluster/{cluster_name}=shared
master_subnet_id = "subnet-8a3517f8"
worker_subnet_ids = [		
    "subnet-8a3517f8",
    "subnet-9b7853f7",
    "subnet-8g9sdfv8"
]

# Number of worker nodes
min_worker_count = 3
max_worker_count = 6

# DNS zone where the domain is placed
hosted_zone = "my-domain.com"
hosted_zone_private = false

# Tags
tags = {
  Application = "AWS-Kubernetes"
}

# Tags in a different format for Auto Scaling Group
tags2 = [
  {
    key                 = "Application"
    value               = "AWS-Kubernetes"
    propagate_at_launch = true
  }
]

# Kubernetes Addons
# Supported addons:
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/storage-class.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/heapster.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/dashboard.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/external-dns.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/ingress.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/autoscaler.yaml
# https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/fluentd-es-kibana-logging.yaml

addons = [
  "https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/storage-class.yaml",
  "https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/heapster.yaml",
  "https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/dashboard.yaml",
  "https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/external-dns.yaml",
  "https://s3.amazonaws.com/scholzj-kubernetes/cluster/addons/autoscaler.yaml"
]

# List of CIDRs from which SSH access is allowed
ssh_access_cidr = [
    "0.0.0.0/0"
]

# List of  CIDRs from which API access is allowed
api_access_cidr = [
    "0.0.0.0/0"
]
