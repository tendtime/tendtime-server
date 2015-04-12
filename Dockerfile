FROM ruby:2.2.0

RUN apt-get update && apt-get install -y imagemagick libmagick++-dev libmagic-dev imagemagick libmagickwand-dev libmagickcore-dev
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
