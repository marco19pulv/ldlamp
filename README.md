# ![Docker-LAMP][logo]
Docker-LAMP is a set of docker images that include the phusion baseimage (18.04 and 20.04 varieties), along with a LAMP stack ([Apache][apache], [MySQL][mysql] and [PHP][php]) all in one handy package.

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Image Versions
[Apache][apache] : `2.4.41`
[MySQL][mysql] : `8.0.36`
[PHP][php] : `8.0.30`
[phpMyAdmin][phpmyadmin] : `5.1.1`

## Developing the image
### Building and running
```bash
# Clone the project from Github
git clone https://github.com/marco19pulv/m19p-docker-lamp.git
cd m19p-docker-lamp

# Build the images
docker build -t docker-lamp:latest -f ./Dockerfile .

# Run the image as a container
docker run -d -p "3000:80" docker-lamp:latest

# Sleep to allow the container to boot
sleep 30

# Curl out the contents of our new container
curl "http://0.0.0.0:3000/"
```

### Testing
We use `docker-compose` to setup, build and run our testing environment. It allows us to offload a large amount of the testing overhead to Docker, and to ensure that we always test our image in a consistent way that's not affected by the host machine.

### One-line testing command
We've developed a single-line test command you can run on your machine within the `docker-lamp` directory. This will test any changes that may have been made, as well as comparing installed versions of Apache, MySQL, PHP and phpMyAdmin against those expected.
```bash
docker-compose -f docker-compose.test.yml -p ci build; docker-compose -f docker-compose.test.yml -p ci up -d; cd tests && ./test.sh; echo "Exited with status code: $?";
```

So what does this command do?

#### `docker-compose -f docker-compose.test.yml -p ci build;`
First, build that latest version of our docker-compose images.
#### `docker-compose -f docker-compose.test.yml -p ci up -d;`
Launch our docker containers (`web2004-php8` etc.) in daemon mode.
#### `cd tests && ./test.sh;`
Change into the test directory and run out tests
#### `echo "Exited with status code: $?"`
Report back whether the tests passed or not

## Building / Releasing
Manually building and releasing can be done with the following:

```bash
docker-compose -f docker-compose.test.yml -p ci build
docker tag ci-web2004-php8 mattrayner/lamp:latest

docker push mattrayner/lamp:latest
```

[logo]: logo.svg

[apache]: http://www.apache.org/
[mysql]: https://www.mysql.com/
[php]: http://php.net/
[phpmyadmin]: https://www.phpmyadmin.net/