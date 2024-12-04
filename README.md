# ![Light-Docker-LAMP][logo]
Light Docker LAMP is a fork of mattrayner/lamp with [Apache][apache], [MySQL][mysql] and [PHP][php] all in one handy package.  
# Versions
[Apache][apache]: `2.4.41`  
[MySQL][mysql]: `8.0.36`  
[PHP][php]: `8.0.30`  
[phpMyAdmin][phpmyadmin]: `5.1.1`

<!-- END doctoc -->

# Building
```bash
git clone https://github.com/marco19pulv/ldlamp.git
cd /home/docker/ldlamp
```

# Deploying
```bash
docker build -t ldlamp:latest -f ./Dockerfile .
docker run --name ldlamp-container -d -p "3000:80" ldlamp:latest 
curl "http://0.0.0.0:3000/"
```

# Wiping
```bash
docker stop ldlamp-container
docker rm ldlamp-container
docker rmi ldlamp:latest
```

[logo]: logo.png
[apache]: http://www.apache.org/
[mysql]: https://www.mysql.com/
[php]: http://php.net/
[phpmyadmin]: https://www.phpmyadmin.net/