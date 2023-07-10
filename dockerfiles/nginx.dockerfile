FROM nginx:stable-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system bahaso
RUN adduser -G bahaso --system -D -s /bin/sh -u ${UID} bahaso
RUN sed -i "s/user  nginx/user bahaso/g" /etc/nginx/nginx.conf

ADD ./nginx/default.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html
