# Badges Engine

This engine manages all related with CrowdInt badges.

[![Build
Status](https://travis-ci.org/zalapeach/badges_engine.svg?branch=master)](https://travis-ci.org/zalapeach/badges_engine)
[![GitHub version](https://badge.fury.io/gh/zalapeach%2Fbadges_engine.svg)](http://badge.fury.io/gh/zalapeach%2Fbadges_engine)
[![Code Climate](https://codeclimate.com/github/zalapeach/badges_engine.png)](https://codeclimate.com/github/zalapeach/badges_engine)

# A brief description

This engine manages all the tables related with badges.

The main table is badges, this table has the following attributes

* id
* name
* image
* description
* created_at
* updated_at
* award_id

This can be accessed in the console as `BadgesEngine::Badge`

The second table is awards, this table has the following attributes

* id
* title
* description
* created_at
* updated_at

This can be accessed in the console as `BadgesEngine::Award`

This is the current database structure, this probably will change in a future

# How to Start the Engine

* Fork or clone the repo
* install all the gems `bundle install`
* Create a db `rake db:create`
* Run the migrations `rake db:migrate`
* Go to spec/dummy and run `rails s`
* Open your browser and go to `localhost:3000` to see the magic :)

# Set up the tests

The engine has tests, to make them pass you need to do the following:

* Run the migrations in test environment `rake db:migrate RAILS_ENV=test`
* run `rspec spec/` to see all the test passing

# How to contribute

* fork the repository
* create a branch
* Add you powerful commits
* Create Pull request

Easy don't you think?

# Testing

The repo has tests, please complete the setup before run tests.

# Decent exposure

We are using Decent Exposure gem http://decentexposure.info/ 

This project rocks and uses MIT-LICENSE.
