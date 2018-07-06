FROM perseidsproject/morpheus:v1.0.0

RUN apt-get update -qq && apt-get install -qq -y ruby ruby-dev

ADD . /app
WORKDIR /app

RUN gem install bundler
RUN bundle install
