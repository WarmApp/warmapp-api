FROM ruby:2.3.1

EXPOSE 3000

RUN mkdir /warmapp-api
WORKDIR /warmapp-api
ADD Gemfile /warmapp-api/Gemfile
ADD Gemfile.lock /warmapp-api/Gemfile.lock
RUN bundle install
ADD . /warmapp-api


