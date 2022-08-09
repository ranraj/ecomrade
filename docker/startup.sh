#! /bin/sh

./wait-for-services.sh
./prepare-db.sh
bundle exec puma -C config/puma.rb
