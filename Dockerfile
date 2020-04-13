FROM nginx

# Install build tools
RUN apt-get -y update && \
    apt-get -y install ruby ruby-dev build-essential \
                       nodejs zlib1g-dev \
                       libmagickwand-dev imagemagick curl

# Fix npm version. Installing from apt raises error:
# `npm does not support Node.js v10.15.2`
RUN curl https://www.npmjs.com/install.sh | sh

# Setup folder structure for Docker
ENV APP_HOME /project
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install Bundler
RUN gem install bundler:1.17.3
RUN bundle config --global silence_root_warning 1

# Setup directory structure for Nginx
ENV NGINX_HOME /usr/share/nginx/html
COPY nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf/default.conf /etc/nginx/conf.d/default.conf

# Install Jekyll (project)
COPY src/Gemfile* $APP_HOME/
ENV BUNDLE_PATH /gems-cache
RUN bundle install --without development test

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
