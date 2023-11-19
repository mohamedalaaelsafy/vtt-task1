### General ###
project_id = "vodafone-technical-task"

env = "dev"

region = "us-central1"

zone = "us-central1-a"


### NETWORK ###
vpc_name = "vtt"

subnet_name = "vtt-subnet"

subnet_cidr = "10.0.1.0/24"

subnet_cidr_sec1 = "10.1.0.0/16"

subnet_cidr_sec2 = "10.2.0.0/16"

alb_ip_enabled = true

alb_ip_name = "vtt-ip"

### GKE CLUSTER ###
cluster_name = "vtt-cluster"

cluster_region = "us-central1"

# cluster_zones = ["us-central1-c", "us-central1-f"]
cluster_zones = ["us-central1-c"]

node_locations = "us-central1-c"

machine_type = "e2-medium"

nodes_per_zone = 1

master_node_cidr = "172.16.0.16/28"

master_authorized_networks = [
  {
    # cidr_block   = "10.0.1.2/32"
    cidr_block   = "0.0.0.0/0"
    display_name = "Allow all"
  }
]


### GS Bucket ###
buckets = [
  {
    name        = "datastore-bucket-1"
    description = "datastore-bucket-1"
    location    = "us-central1"
  },
  {
    name        = "datastore-bucket-2"
    description = "datastore-bucket-2"
    location    = "us-central1"
  },
  {
    name        = "datastore-bucket-3"
    description = "datastore-bucket-3"
    location    = "us-central1"
  }
]

### VM INSTANCE ###
machine_name = "vtt"

os_image = "ubuntu-2004-focal-v20231101"

vm_machine_type = "e2-micro"

### Databases ###
dataset = [
  {
    name        = "dataset1"
    description = "dataset1"
  },
  {
    name        = "dataset2"
    description = "dataset2"
  },
  {
    name        = "dataset3"
    description = "dataset3"
  }
]
