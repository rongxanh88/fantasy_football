# Daily Fantasy Football Lineup API

A Rails API that aggregates data and generates expected fantasy point production for NFL players for the past three seasons. New or rookie players currently not supported.
The API endpoints will output players who are active for the current week. Players on bye weeks, players who are injured, players who are suspended, or players who have
already played a game this week are excluded.

This API currently supports scoring and lineup format for Draftkings only.

## Getting Started

This API supplies five endpoints. The following endpoints are as follows:

```
/api/v1/quarterbacks.json

/api/v1/runningbacks.json

/api/v1/receivers.json

/api/v1/tightends.json

/api/v1/defenses.json
```

All endpoints return players or defenses with an ID, Name, Position, and Expected Point Production.



### Prerequisites

The following are the minimum requirements for rails and ruby. Postgres must also be installed
on your machine.

```
rails 5.1.4
ruby 2.4.1
Postgres
```

An account with [SportsFeed](https://www.mysportsfeeds.com/).
A premium account with [Fantasy Football Nerd](https://www.fantasyfootballnerd.com/) which costs $11.95 for the
entire season

This app also uses the figaro gem. [Figaro](https://github.com/laserlemon/figaro)
This gem generates an application.yml file, which you will need to add a few environmental
variables for the API calls to work.

### Installing

A step by step series of examples that tell you have to get a development env running

Clone down the repository and run the following commands to setup the database.

```
bundle install
rake db:create
rake db:migrate
```

Now run the figaro command, which creates the application.yml file. Then add the following ENV
variables.

```
bundle exec figaro install
```

In the application.yml file:
```
sports_feed_login: 'your login'
sports_feed_pw: 'your pw'
ff_nerd_api_key: 'your api key'
```

Now, you can seed the database with
```
rake db:seed
```

Once you are done seeding, you can run an instance of the app locally with
```
rails server
```

Now hit one of the endpoints like localhost:3000/api/v1/quarterbacks.json to get a response like
```
  "quarterbacks": [
    {
      "id": "7549",
      "first_name": "Tom",
      "last_name": "Brady",
      "position": "QB",
      "expected_point_production": "24.59"
    },
    {
      "id": "7641",
      "first_name": "Drew",
      "last_name": "Brees",
      "position": "QB",
      "expected_point_production": "25.87"
    },
    {
      "id": "7457",
      "first_name": "Teddy",
      "last_name": "Bridgewater",
      "position": "QB",
      "expected_point_production": "15.44"
    }
  ]
```

## Running the tests

Run all rspec tests with the following command.
```
rspec
```

### Break down into end to end tests

Testing currently targests the API endpoints with request tests. Additionally, there are model tests that
test database validations.

## Deployment

This app is currently deployed live, on [Heroku](https://fantasy-football-api-1703.herokuapp.com/)

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - Web Framework
* [Travis CI](https://travis-ci.org/) - Continuous Integration Tool
* [Hakiri](https://hakiri.io/) - Security Monitoring Tool for Rails Apps
* [PostgreSQL](https://www.postgresql.org/) - Open Source Database

## Authors

* **Bao Nguyen** - *Initial work* - [GitHub](https://github.com/rongxanh88)

## Current Build Status
https://hakiri.io/github/rongxanh88/fantasy_football/master.svg
https://travis-ci.org/rongxanh88/fantasy_football.svg?branch=add_travis_ci
https://forthebadge.com/images/badges/built-with-love.svg
https://forthebadge.com/images/badges/made-with-ruby.svg
https://forthebadge.com/images/badges/winter-is-coming.svg