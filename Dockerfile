FROM nginx

ENV NGINX_HOME /usr/share/nginx/html

COPY src/_site/ $NGINX_HOME

EXPOSE 80
