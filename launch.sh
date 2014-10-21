#! /bin/bash
# Launch docker running an elastic search node
# Generally you would only run on ES node per host

# The name of the elasticsearch cluster
CLUSTER_NAME=test
# The name of the node. If left blank, ES will choose a name
NODE_NAME=
# Path to the data folder on the host
DATA_DIR=/var/data/elasticsearch
# Amount of memory for ES to use
HEAP_SIZE=2g
# The AWS region you are launching instances in
AWS_REGION=eu-west-1
# AWS Security Groups to be used to find other ES instances
AWS_GROUPS=ElasticSearch
# AWS Tags to use to find other ES instances. Values for the tag "escluster" on the EC2 instances
AWS_TAGS=

docker run -d -p 9200:9200 -p 9300:9300 -v $DATA_DIR:/data -e "ES_HEAP_SIZE=$HEAP_SIZE" dmopen/elasticsearch "--node.name=$NODE_NAME" "--cluster.name=$CLUSTER_NAME" "--cloud.aws.region=$AWS_REGION" "--discovery.ec2.groups=$AWS_GROUPS" "--discovery.ec2.tags.escluster=$AWS_TAGS"
