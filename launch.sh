#! /bin/bash
# Launch docker running an elastic search node
# Generally you would only run on ES node per host

CLUSTER_NAME=test
NODE_NAME=
DATA_DIR=/var/data/elasticsearch
HEAP_SIZE=2g
AWS_REGION=eu-west-1
AWS_GROUPS=ElasticSearch
AWS_TAGS=

docker run -d -p 9200:9200 -p 9300:9300 -v $DATA_DIR:/data -e "ES_HEAP_SIZE=$HEAP_SIZE" dmopen/elasticsearch "--node.name=$NODE_NAME" "--cluster.name=$CLUSTER_NAME" "--cloud.aws.region=$AWS_REGION" "--discovery.ec2.groups=$AWS_GROUPS" "--discovery.ec2.tags=$AWS_TAGS"
