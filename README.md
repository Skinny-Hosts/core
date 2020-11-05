# Here is the image of NGINX with custom configurations and using its Alpine base version.

![Docker](https://github.com/Skinny-Hosts/core-nginx-docker-image/workflows/Docker/badge.svg?branch=master)

## Running

Use docker-compose to run service:

`docker-compose up`

A php file are placed in www folder and this folder is mounted as volume to /var/www/html, which is the root of the virtual host.

### New Releases

Our images are hosted into GitHub Container Registry.
New releases are made automatically from push events to the branch **master**.