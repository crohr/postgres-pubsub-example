FROM ruby:2.5

WORKDIR /usr/src/app

ADD Gemfile* ./
RUN bundle install
ADD . ./
