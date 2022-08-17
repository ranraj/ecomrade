#! /bin/sh

docker/wait-for-services.sh
docker/prepare-db.sh
#docker/code-analyzer.sh
bundle exec puma -C ./config/puma.rb