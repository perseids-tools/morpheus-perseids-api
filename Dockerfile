FROM perseidsproject/morpheus:v1.0.0

RUN apt-get update -qq && apt-get install -qq -y ruby ruby-dev

ADD . /app
WORKDIR /app

ENV RACK_ENV=production

RUN gem install bundler
RUN bundle install

CMD bundle exec ruby app.rb
