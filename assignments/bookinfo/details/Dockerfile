FROM ruby:2.7

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY src/ /usr/src/app/
RUN bundle install


CMD ["ruby","/usr/src/app/details.rb","9080"]