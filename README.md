# Here are the images of NGINX and PHP-FPM with custom configurations but using its Alpine versions.
## Running

Use docker-compose to run services:

`docker-compose up`

A php file are placed in www folder and this folder is mounted as volume to /var/www/html, wich the root of the virtual host.

## How to build and publish a new version of core images to docker hub

### Building images to publish updates

An easy method is to build with docker-compose. Docker Compose file is prepared to receive the image version from the .env file, so check it before build.

`docker-compose build --no-cache`

This {image name}:{version} will be used to reference this image during the publish operation.

**Versions** should be consistent with repo releases and that present into Dockerfiles.

### Publishing new version

#### Login

First, do login. If you are a member of the Core Team, at this moment you should use your own credentials from Docker Hub.

`docker login -u {your username}`

As auto build is not configured yet, publishing images versions are made manually.

Eg.:

Publishing, a release to core nginx web server:

`docker push skinny-hosts/core-nginx-web-server:{version}`