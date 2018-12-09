FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
ARG RAILS_MASTER_KEY
# TODO: assets:precompileは初期ビルド時に動かないため、ここにあるべきではない。適切な場所に移動する
RUN DB_ADAPTER=nulldb RAILS_ENV=production bundle exec rake assets:precompile
