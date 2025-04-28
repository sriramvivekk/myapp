FROM ruby:2.7.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV RAILS_ENV=development

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]