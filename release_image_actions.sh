#!/bin/bash
set -e
#SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

TAG="0.0.3"
IMAGE_NAME="mario51/carro_de_madera"
DOCKER_FILE="server_publish.dockerfile"
NAME_CONTAINER="carro_de_madera_web_server"
PORTS="80:80"


echo -e "\nBuild the image $IMAGE_NAME:$TAG?";
read -p "1)Yes | 2)No: " doBuild;

if [ "$doBuild" == "1" ]; then
  echo "BUILDING..."
  echo "docker build -f $DOCKER_FILE --tag $IMAGE_NAME:$TAG ."

  docker build -f $DOCKER_FILE --tag $IMAGE_NAME:$TAG .

elif [ "$doBuild" == "2" ]; then
  echo "no build"
else
  echo "bad input"
  exit 1
fi





echo -e "\n\nUpload the image $IMAGE_NAME:$TAG?"
read -p "1)Yes | 2)No: " doUpload

if [ "$doUpload" == "1" ]; then
  echo "UPLOADING..."
  echo "docker push $IMAGE_NAME:$TAG"

  docker push $IMAGE_NAME:$TAG
  
elif [ "$doUpload" == "2" ]; then
  echo "no upload..."
else
  echo "bad input"
  exit 1
fi





echo -e "\n\nRun the image $IMAGE_NAME:$TAG?"
read -p "1)Yes | 2)No: " runImage

if [ "$runImage" == "1" ]; then
  echo "RUNNING..."
  echo "docker run --rm -d  --name $NAME_CONTAINER -p $PORTS $IMAGE_NAME:$TAG"

  docker run --rm -d --name $NAME_CONTAINER -p $PORTS $IMAGE_NAME:$TAG

elif [ "$runImage" == "2" ]; then
  echo "no run"
else
  echo "bad input"
  exit 1
fi
