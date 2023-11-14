project_id = "vodafone-technical-task"

env = "dev"

region = "us-central1"


### NETWORK ###
vpc_name = "vtt"

vpc_cidr = "172.16.1.0/24"

subnet_name = "vtt-subnet"

subnet_cidr = "172.22.0.0/16"


### GKE CLUSTER ###
cluster_name = "vtt-cluster"

cluster_region = "us-central1"

cluster_zones = ["us-central1-c", "us-central1-f"]

machine_type = "e2-standard-2"

node_count = 4

nodes_per_zone = 2

### GS Bucket ###
buckets = [ 
    {
    name = "mhklhkj"
    description = "mhklhkj"
    location = "europe-west6"
    },
    {
    name = "mhklhkj"
    description = "mhklhkj"
    location = "europe-west6"
    },
    {
    name = "mhklhkj"
    description = "mhklhkj"
    location = "europe-west6"
    }
]