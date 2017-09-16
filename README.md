# Daily Fantasy Football Lineup API

A Rails API that aggregates data and generates expected fantasy point production for NFL players for the past three seasons. New or rookie players currently not supported.
The API endpoints will output players who are active for the current week. Players on bye weeks, players who are injured, players who are suspended, or players who have
already played a game this week are excluded.

This API currently supports scoring and lineup format for Draftkings only.

## Getting Started

This API supplies seven endpoints. The following endpoints are as follows:

```
/api/v1/quarterbacks.json

/api/v1/runningbacks.json

/api/v1/receivers.json

/api/v1/tightends.json

/api/v1/defenses.json

/api/v1/weather.json

/api/v1/salaries
```

All endpoints return players or defenses with an ID, Name, Position, Salary, and Expected Point Production.

The Weather endpoint returns weather forecasts for all of the current week's games.

Example
```
{
  "isDome": "0",
  "low": "61",
  "high": "72",
  "forecast": "Mostly Cloudy",
  "windSpeed": "4",
  "windChill": "66",
  "imageLink": "https://www.fantasyfootballnerd.com/images/weather/31/28.gif",
  "awayTeam": "HOU",
  "homeTeam": "CIN"
}
```

The last endpoint ```/api/v1/salaries``` is a POST route. This is configured to accept CSV file uploads to the server that contain DraftKings salary data.
In order to post to it, use a form with a file input field type to submit data to this endpoint. Make sure the send the post request with the file
encapsulated in a JavaScript FormData object.

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
rake build:all
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

The database can now be reseeded. However, when you ran the ```rake build:all``` command, it loaded the database that has been saved to
version control.

You can run an instance of the app locally with
```
rails server
```

Now hit one of the endpoints like localhost:3000/api/v1/quarterbacks.json to get a response like
```
  "quarterbacks": [
    {
      "id": "7916",
      "first_name": "Derek",
      "last_name": "Carr",
      "position": "QB",
      "expected_point_production": "19.89",
      "salary": "6700"
    },
    {
      "id": "6114",
      "first_name": "Joe",
      "last_name": "Flacco",
      "position": "QB",
      "expected_point_production": "19.7",
      "salary": "5500"
    },
    {
      "id": "7181",
      "first_name": "Chad",
      "last_name": "Henne",
      "position": "QB",
      "expected_point_production": "9.57",
      "salary": "4300"
    }
  ]
```

## Rake File
In the ```./lib/build/``` directory, you will see a rake file.

```rake build:all``` Drops the current database, loads from a pg_dump, then runs all rspec tests to make sure everything works.

```rake migrate_and_seed``` Drops the database, runs all migrations, runs manually seeding, and then creates a DB backup.

## Running the tests

Run all rspec tests with the following command.
```
rspec
```
At the moment, almost all API endpoint testing is skipped due to changing conditions that auto filter out the results. In order
for testing to work, I'll have to implement stubbing to return the testing data.

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
![build](https://travis-ci.org/rongxanh88/fantasy_football.svg?branch=add_travis_ci)
![security](https://hakiri.io/github/rongxanh88/fantasy_football/master.svg)
![love](https://forthebadge.com/images/badges/built-with-love.svg)
![ruby](https://forthebadge.com/images/badges/made-with-ruby.svg)
![winter](https://forthebadge.com/images/badges/winter-is-coming.svg)