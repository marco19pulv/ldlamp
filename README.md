# ![Light-Docker-LAMP][logo]
Light Docker LAMP is a fork of mattrayner/lamp with [Apache][apache], [MySQL][mysql] and [PHP][php] all in one handy package.  

### Versions
[Apache][apache]: `2.4.41`  
[MySQL][mysql]: `8.0.36`  
[PHP][php]: `8.0.30`  
[phpMyAdmin][phpmyadmin]: `5.1.1`

<!-- END doctoc -->

### Deploying
###### Cloning
```bash
git clone https://github.com/marco19pulv/ldlamp.git
cd /home/docker/ldlamp
```
###### Building
```bash
docker build -t ldlamp -f ./Dockerfile .             #Image
docker run --name ldlamp -d -p "3000:80" ldlamp      #Container
docker logs ldlamp  
curl "http://127.0.0.1:3000/"
```
###### Wiping
```bash
docker stop ldlamp
docker rm ldlamp    #Container
docker rmi ldlamp   #Image
```
###### STARTING
```bash
edit ROW74 of Dockerfile to select the app to be installed on webserver
docker start ldlamp
```

[logo]: logo.png
[apache]: http://www.apache.org/
[mysql]: https://www.mysql.com/
[php]: http://php.net/
[phpmyadmin]: https://www.phpmyadmin.net/