FROM ruby:3.1.2
WORKDIR /app
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libvips nodejs npm yarn postgresql tzdata 
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
COPY . .
CMD [ "bundle","exec","rails","server","-b","0.0.0.0" ]
