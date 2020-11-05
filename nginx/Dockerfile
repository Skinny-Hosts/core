# @version 1.0.0
# Configures NGINX .

FROM nginx:1.19-alpine
LABEL maintainer="marcosfreitas@c4network.com.br"

# @todo change user to not run as root
#RUN apk add --no-cache shadow &&\
#    usermod -u 1000 nginx

#USER nginx

EXPOSE 80
# @todo not prepared to work with SSL connections yet
EXPOSE 443

# @bug misconfiguration, should be tested
#RUN cd / &&\
#    wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh &&\
#    chmod +x wait-for-it.sh

RUN apk update && apk add --no-cache openssl shadow bash wait4ports &&\
    rm /etc/nginx/nginx.conf &&\
    rm /etc/nginx/conf.d/default.conf

# From the context of this Dockerfile
ADD /nginx/nginx.conf /etc/nginx/nginx.conf

#ENV DOCKERIZE_VERSION v0.6.1
#RUN wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
#    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
#    && rm dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

# @bug problem with folder's permissions
RUN mkdir -p /etc/nginx/sites-enabled &&\
    mkdir -p /etc/nginx/sites-available &&\
    chmod 751 -R /etc/nginx;

ADD /nginx/vhost-app.conf /etc/nginx/sites-available/app

RUN ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

# Copying configuration scripts to container

COPY /scripts/ /usr/share/.docker/scripts

RUN chmod +x /usr/share/.docker/scripts/*.sh &&\
    mkdir -p /var/www/html &&\
    bash /usr/share/.docker/scripts/set-right-permissions-by-path.sh /var/www/ &&\
    bash /usr/share/.docker/scripts/set-right-permissions-by-path.sh /var/www/html

WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]