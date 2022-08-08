# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Contribute :

Use ```rubocop -a``` before commit.

Build :
- bundle install
- rails s

Dev :

```
http://localhost:3000
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

elastic search
```
docker-compose -f elastic_kibana_compose.yml up
```