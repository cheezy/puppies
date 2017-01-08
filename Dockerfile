From ruby:1.9.3

WORKDIR /puppies

COPY . .

RUN bundle install && \
    bundle exec rake db:migrate && \
    bundle exec rake db:seed

CMD ["rails", "s"]
