FROM starefossen/ruby-node:latest

RUN mkdir -p /usr/src/app
ADD ./Gemfile* /usr/src/app/
ADD . /usr/src/app
WORKDIR /usr/src/app

RUN set -ex && \
    mkdir -p /app/heroku/ruby/bundle/ruby/2.2.0 && \
    gem install bundler -v 1.13.7 --no-ri --no-rdoc

ADD Gemfile* /usr/src/app/

RUN bundle
