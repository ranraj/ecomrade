FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile

ADD Gemfile.lock /myapp/Gemfile.lock

RUN gem update --system
RUN gem install bundler
RUN gem install rake
RUN gem install puma
RUN apt install -y netcat
RUN bundle install
ADD . /myapp

CMD ["docker/startup.sh"]