FROM ruby:3.1

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler -v 2.4.10

COPY . .

RUN bundle install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]







