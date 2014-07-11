# Kardex Crowd Interactive

This application should be the all-in-one services for all crowd members.

[![Build
Status](https://travis-ci.org/crowdint/kardex-crowdint-com.svg?branch=master)](https://travis-ci.org/crowdint/kardex-crowdint-com)
[![Stories in Ready](https://badge.waffle.io/crowdint/kardex-crowdint-com.png?label=ready&title=Ready)](https://waffle.io/crowdint/kardex-crowdint-com)
[![Dependency Status](https://gemnasium.com/crowdint/kardex-crowdint-com.svg)](https://gemnasium.com/crowdint/kardex-crowdint-com)

## Ruby version

    ruby '2.1.2'

## System dependencies

    'rails', '4.0.4'

## Configuration

    $ git clone git@github.com:crowdint/kardex-crowdint-com.git
    $ cd kardex-crowdint-com
    $ bundle install

### Set up the repos for different environments

    $ git remote add origin git@github.com:crowdint/kardex-crowdint-com.git
    $ git remote add heroku git@heroku.com:kardex-crowdint-com.git
    $ git remote add integration git@heroku.com:kardex-integration.git

* origin - for `development`
* heroku - for `production`
* integration - for `production`

## Database creation
### Get all migrations from badges_engine

    $ rake badges_engine:install:migrations

# Create the db

    $ rake db:create
    $ rake db:migrate

## Set environment variables
### Config figaro

We are using figaro to hide some variables with sensible
information, so please create the file `config/application.yml`
based on the information of `config/application.yml` and add
your variables.

## Database initialization
### Bamboohr Initialization

    $ export BAMBOO_API_KEY=generated_bamboohr_api_key
    $ export BAMBOO_SUBDOMAIN=crowdint
    $ rake bamboo:sync_users

## Configure carrierwave for upload image
### Configure carrierwave

Open the file `config/initializers/carrierwave.rb` and configure
carrierwave with the values of the variables

## How to run the test suite
### Prepare your Database for test

    $ rake db:migrate RAILS_ENV=test

### Prepare your bamboohr rake task for test

    $ export BAMBOO_API_KEY=API_TOKEN RAILS_ENV=test
    $ export BAMBOO_SUBDOMAIN=crowdint RAILS_ENV=test

### Using Rspec and Rspec Capybara

    $ bundle exec rspec spec/

### SimpleCov

After running your test suite just do next:

    $ open coverage/index.html

### Using  Nyan Cat

You can either specify the formatting when using the `rspec` command:

    $ rspec --format NyanCatFormatter

Check [this page](https://github.com/mattsears/nyan-cat-formatter)
for more information.

## Metrics Tools
### Using Rails Best Practices

    $ rails_best_practices

## Run Application

    $ rails server

## Heroku

* http://kardex.crowdint.com - for production
* http://kardex-integration.herokuapp.com - for integration
