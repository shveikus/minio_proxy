FROM ruby:2.5-alpine3.11

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN apk add --no-cache g++ musl-dev make libstdc++ \ 
&& gem update --system \
&& gem install bundler \
&& bundle install

ADD . /app
RUN bundle install

EXPOSE 9393

CMD ["bundle", "exec", "rackup", "config.ru"]
