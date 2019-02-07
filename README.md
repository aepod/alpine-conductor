Docker Conductor Build - PHP-FPM 7.x & Gulp/Nodejs/Yarn on Alpine Linux

Repository: https://github.com/aepod/alpine-conductor

Lightweight and secure Alpine Linux distribution
PHP-FPM runs as nobody
Uses PHP 7.1 or 7.2 for better performance, lower cpu usage & memory footprint
Optimized to only use resources when there's traffic (by using PHP-FPM's ondemand PM)

The logs of all the services are redirected to the output of the Docker container (visible with docker logs -f <container name>)

Usage
Start the Docker container:
#php71
docker run -p 80:8080 aepod/alpine-conductor:php71
#php72
docker run -p 80:8080 aepod/alpine-conductor:php72


Loosely based on: https://hub.docker.com/r/trafex/alpine-nginx-php7/