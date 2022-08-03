#!/bin/bash
# Script to create docker based runtime environment to reproduce python based research work
# Version = 2.0
# Maintainer = Naeem Muhammad <naeem.muhammad@kuleuven.be>
set -x


BASE_DIR="$PWD"		#Path to docker directory
CONTAINER_NAME='repro_python'
IMAGE_NAME='repro_python'

docker build -t ${IMAGE_NAME} .

container_id=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)
if [ ! "${container_id}" ]; then
  echo "Container doesn't exist, so create a container."
fi
unset container_id
docker container rm -f ${CONTAINER_NAME}

docker run -di --name ${CONTAINER_NAME} -v /${BASE_DIR}/shared:/home/docker/scripts ${IMAGE_NAME}
winpty docker exec -w //home//docker//scripts -it ${CONTAINER_NAME} //bin//bash