#!/bin/bash

# Copyright 2015 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_PORT=${HTTP_PORT:-9200}
export TRANSPORT_PORT=${TRANSPORT_PORT:-9300}
export MINIMUM_MASTER_NODES=${MINIMUM_MASTER_NODES:-2}

/elasticsearch_logging_discovery >> /elasticsearch/config/elasticsearch.yml

chown -R elasticsearch:elasticsearch /data

/bin/su -c /elasticsearch/bin/elasticsearch elasticsearch
