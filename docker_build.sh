#!/usr/bin/env sh

# Check whether to run each block
GIT=false
STOP=false
DELETE=false
CLEAN=false
BUILD=false
RUN=false

# Read command-line arguments
while getopts "gsdcbr" opt; do
  case $opt in
    g) GIT=true ;;
    s) STOP=true ;;
    d) DELETE=true ;;
    c) CLEAN=true ;;
    b) BUILD=true ;;
    r) RUN=true ;;
    *) echo "Usage: $0 [-g][-s][-d][-c][-b][-r]"; exit 1 ;;
  esac
done

# 1. Git push (if requested)
if [ "$GIT" = true ]; then
  printf "\n@@@@@@@@@@ Adding, Committing and Pushing with Git (flag -g) ...\n"
  git add . &&
  git commit -m "Commit" &&
  git push
fi

# 2. Stop container (if requested)
if [ "$STOP" = true ]; then
  printf "\n@@@@@@@@@@ Stopping Container (flag -s)...\n"
  sudo docker stop ldlamp-container
fi

# 3. Delete container (if requested)
if [ "$DELETE" = true ]; then
  printf "\n@@@@@@@@@@ Deleting Container (flag -d) ...\n"
  sudo docker rm ldlamp-container
fi

# 4. Cleanup (if requested)
if [ "$CLEAN" = true ]; then
  printf "\n@@@@@@@@@@ Cleaning Docker (flag -c) ...\n"
  sudo docker rmi ldlamp:latest &&    # Remove image
  sudo docker volume prune -f &&      # Remove all unused volumes
  sudo docker network prune -f &&     # Remove all unused networks
  sudo docker system prune -a -f   # Remove all Docker objects (containers, images, volumes, and networks)
fi

# 5. Build (if requested)
if [ "$BUILD" = true ]; then
  printf "\n@@@@@@@@@@ Building Docker Image (flag -b) ...\n"
  sudo docker build -t ldlamp:latest -f ./Dockerfile .
fi

# 6. Run (if requested)
if [ "$RUN" = true ]; then
  printf "\n@@@@@@@@@@ Running Docker Container (flag -r) ...\n"
  sudo docker run --name ldlamp-container -d -p "3000:80" ldlamp:latest
fi