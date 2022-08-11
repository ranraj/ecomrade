# README

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
Note : Please ensure that you have set the password (POSTGRES_PASSWORD) in the docker/pg_compose.yml

Start the Ecom application with dependency system
```
docker compose -f docker_compose.yml -f docker_compose.webapp.yml up
```
Boot only dependency systems through docker compose. This could be useful for development purpose. Start the puma server on you local system and connect dependency from docker.
```
docker-compose -f docker/docker_compose.yml up
```
Start your rails server from the terminal. Use the docker postgres db password (password) in config/database.yml
```
rails s
```

Stop and clean
```
docker-compose -f docker/docker_compose.develop.yml down --volumes
```

# Dependency systems

SideKiq - makesure redis is running
```
docker run --name rdb -p 6379:6379 redis
```
Rerun stoped container
```
docker start  rdb
```
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

elastic search
```
docker-compose -f elastic_kibana_compose.yml up
```

Build :
```
- bundle install
- rails s
```

Dev :

```
http://localhost:3000
```

Docker process
```
docker ps 
```
Docker logs follow
```
docker logs <DOCKER_CONTAINER_ID> --follow
```