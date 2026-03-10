#!/bin/bash

# Stop & remove old container
docker stop api-gateway || true
docker rm api-gateway || true

# Build new image
docker build -t api-gateway ./docker

# Run new container on existing npm-network
docker run -d \
  --name api-gateway \
  --network npm-network \
  -p 8080:8080 \
  api-gateway