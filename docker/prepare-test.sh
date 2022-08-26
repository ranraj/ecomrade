#reset the test data bed
bundle exec rails db:reset RAILS_ENV=test
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rails db:test:prepare RAILS_ENV=test