#!/usr/bin/env sh

git add .
git commit -m "Commit"
git push

docker stop ldlamp-container

docker rm ldlamp-container
docker rmi ldlamp:latest
docker volume prune -f
docker network prune -f
docker system prune -a -f

docker build -t ldlamp:latest -f ./Dockerfile .
docker run --name ldlamp-container -d -p "3000:80" ldlamp:latest