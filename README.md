Kardex Crowd Interactive
===

This application should be the all-in-one services for all crowd members.

## Ruby version
	ruby '2.1.0'

## System dependencies
	'rails', '4.0.4'

	'pg'

## Configuration
	$ git clone git@github.com:crowdint/kardex-crowdint-com.git
	$ cd kardex-crowdint-com
	$ bundle install


## Database creation
	$ rake db:create
	$ rake db:migrate

## Database initialization
### Bamboohr Initialization
	$ export 'BAMBOO_API_KEY'='generated_bamboohr_api_key'
	$ export 'BAMBOO_SUBDOMAIN'='crowdint'
	$ rake bamboo:sync_users 

## How to run the test suite
### Prepare your Database for test
	$ rake db:migrate RAILS_ENV=test
	
### Prepare your bamboohr rake task for test
	$ export 'BAMBOO_API_KEY'='API_TOKEN' RAILS_ENV=test
	$ export 'BAMBOO_SUBDOMAIN'='crowdint' RAILS_ENV=test
### Using Rspec and Rspec Capybara
	$ bundle exec rspec spec/

### Using  Nyan Cat

You can either specify the formatting when using the `rspec` command:

    rspec --format NyanCatFormatter

## Run Application

	$ rails server

