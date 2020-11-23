sudo docker rm -f $(docker ps -aq)

sudo docker rmi $(docker images -q)

sudo docker volume rm $(docker volume ls -q)
