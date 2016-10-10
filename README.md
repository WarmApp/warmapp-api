# warmapp-api

API to creates an youtube playlist with facebook event posted videos.

[![Code Climate](https://codeclimate.com/github/WarmApp/warmapp-api/badges/gpa.svg)](https://codeclimate.com/github/WarmApp/warmapp-api) [![Build Status](https://snap-ci.com/WarmApp/warmapp-api/branch/master/build_image)](https://snap-ci.com/WarmApp/warmapp-api/branch/master) [![Test Coverage](https://codeclimate.com/github/WarmApp/warmapp-api/badges/coverage.svg)](https://codeclimate.com/github/WarmApp/warmapp-api/coverage)

# Docker

## Run

```
bin/setup
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose up web
```

## Tests

If you want run tests inside containers. Just run:

```
bin/setup
docker-compose run test rake db:create
docker-compose run test rake db:migrate
docker-compose run test
```
