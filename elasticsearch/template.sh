#!/bin/bash

for i in {30..0}; do
    if curl elasticsearch:9200; then
        curl -XPUT elasticsearch:9200/_template/geopoint -d '
            {
                "index_patterns" : "profit*",
                "settings": {
                   "number_of_shards": 1,
                   "number_of_replicas": 0,
                   "refresh_interval": "10s"
                },
                "mappings" : {
                    "properties": {
                        "coordinates": {
                            "type": "geo_point"
                        }
                    }
                }
            }';
            break;
    fi
    sleep 2
done