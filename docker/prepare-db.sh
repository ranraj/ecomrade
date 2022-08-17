#! /bin/sh

# If database exists, migrate. Otherweise setup (create and seed)
bundle exec rake db:prepare && echo "Database is ready after rake!"
#elastic search
bundle exec rake searchkick:reindex CLASS=Product & echo "Reindexing"
#reset the test data bed
bundle exec rails db:reset RAILS_ENV=test 
