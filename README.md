# README
## Ecomrade - Ecommerse application

[![Build Status](https://app.travis-ci.com/ranraj/ecomrade.svg?branch=main)](https://app.travis-ci.com/github/ranraj/ecomrade)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.1.2, Rails version - 7.0.3
    
* System dependencies - Redis, Postgres, Elastic search

* Configuration
    /config/development.rb, config/mail.yml
* Database creation
    create database ecom_development
* Database initialization
    rails db:migrate RAILS_ENV=development
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
    Elastic search, Sidekiq, Delayed_job
* Deployment instructions
    Docker build . -t local/ecom
    Docker start local/ecom
* ...

Contribute :

    - Use ```rubocop -a``` before commit.

Start application in Docker development mode. 

Docker v20.10.17 +

Below docker compose would startup the dependency systems.
- Postgres db
- Kibana
- Redis
- Elastic search
Note : 
- Please ensure that you have set the password (POSTGRES_PASSWORD) in the docker/pg_compose.yml
- Run the docker compose with webapp for the very first time to ignite the database setup. You can manually stop the ecom app container and run your local rails app server.

Start the Ecom application with dependency system
```
docker compose -f docker_compose.yml -f docker_compose.webapp.yml up -d
```
Boot only dependency systems through docker compose. This could be useful for development purpose. Start the puma server on you local system and connect dependency from docker.
```
docker-compose -f docker/docker_compose.yml up
```
Set environment variable to use host rails server to point the docker instance for dependency system
```
export ELASTICSEARCH_URL="http://localhost:9200"
export REDIS_SIDEKIQ_URL="redis://localhost:6379/0"
export ECOM_DATABASE_HOST="localhost"
export ECOM_DATABASE_PORT="5432"
export ECOM_DATABASE_USERNAME="ecomadmin"
export ECOM_DATABASE_PASSWORD="ecomdev@123
```
Start your rails server from the terminal. Use the docker postgres db password (password) in config/database.yml
```
rails s
```

Stop running containers through compose file
```
docker compose -f docker-compose.yml down
```
Remove the docker compose volume
```
docker compose -f docker-compose.yml down --volumes
```

# Dependency systems

Redis browser
```
npm install redis-commander
redis-commander
```

Start the sidekqi
```
bundle exec sidekiq
```
Sidekiq
```
http://localhost:3000/sidekiq
```
Start Delayed job :
```
./bin/delayed_job start
./bin/delayed_job stop
```

Run the below rake command to reindex
```
rake searchkick:reindex:all
```

Access application :

```
http://localhost:3000
```
Sidekiq
```
http://localhost:3000/sidekiq
```

Access docker container:


```
#Docker process
docker ps 
```

```
#Docker logs follow
docker logs <DOCKER_CONTAINER_ID> --follow
```