# warmapp-api

API to creates an youtube playlist with facebook event posted videos.

[![Code Climate](https://codeclimate.com/github/WarmApp/warmapp-api/badges/gpa.svg)](https://codeclimate.com/github/WarmApp/warmapp-api) [![Build Status](https://travis-ci.org/WarmApp/warmapp-api.svg?branch=development)](https://travis-ci.org/WarmApp/warmapp-api) [![Test Coverage](https://codeclimate.com/github/WarmApp/warmapp-api/badges/coverage.svg)](https://codeclimate.com/github/WarmApp/warmapp-api/coverage)

# Tests

Docker is working in this projetc. If you want run tests inside containers. Just run:

```
bin/setup
docker-compose run rspec rake db:create
docker-compose run rspec rake db:migrate
docker-compose run rspec
```

