FROM nginx:1.17-alpine

# Install build tools
RUN apk add --no-cache \
        ruby ruby-dev curl nodejs openssl-dev build-base \
        imagemagick6 imagemagick6-libs imagemagick6-dev \
        zlib zlib-dev ruby-bigdecimal ruby-webrick ruby-etc nodejs npm

# Setup folder structure for Docker
ENV APP_HOME /project
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install Bundler
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc
ENV BUNDLE_PATH /gems-cache
RUN gem install bundler:1.17.3
RUN bundle config --global silence_root_warning 1

# Setup directory structure for Nginx
ENV NGINX_HOME /usr/share/nginx/html
COPY nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf/default.conf /etc/nginx/conf.d/default.conf

# Install Jekyll (project)
COPY src/Gemfile* $APP_HOME/
RUN bundle install --jobs 4 --without development test

# Build production copy of the project
COPY src $APP_HOME
RUN npm install
RUN npm run build

# Move built site (static) to Nginx root
RUN rm -rf $NGINX_HOME
RUN mv $APP_HOME/_site/ $NGINX_HOME

# Expose Nginx webserver port
EXPOSE 80

# Start webserver
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
