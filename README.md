# ![Light-Docker-LAMP][logo]
Light-Docker-LAMP is a fork of mattrayner/lamp with ([Apache][apache], [MySQL][mysql] and [PHP][php]) all in one handy package.

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Package Versions
[Apache][apache] : `2.4.41`
[MySQL][mysql] : `8.0.36`
[PHP][php] : `8.0.30`
[phpMyAdmin][phpmyadmin] : `5.1.1`

### Deployment
```bash
# Clone the project from Github
git clone https://github.com/marco19pulv/ldlamp.git
cd ldlamp
# Build the images
docker build -t ldlamp:latest -f ./Dockerfile .
# Run the image as a container
docker run -d -p "3000:80" ldlamp:latest
# Sleep to allow the container to boot
sleep 30
# Curl out the contents of our new container
curl "http://0.0.0.0:3000/"
```

[logo]: logo.svg

[apache]: http://www.apache.org/
[mysql]: https://www.mysql.com/
[php]: http://php.net/
[phpmyadmin]: https://www.phpmyadmin.net/