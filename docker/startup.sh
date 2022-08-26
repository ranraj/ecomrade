#! /bin/sh

docker/wait-for-services.sh
docker/prepare-db.sh
docker/prepare-test.sh
#docker/code-analyzer.sh
bundle exec rails db:environment:set RAILS_ENV=test
bundle exec puma -C ./config/puma.rb 