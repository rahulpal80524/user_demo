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
rails new user_demo

add gems

gem 'devise' 
gem 'will_paginate', '~> 3.3' 
gem 'faker' 
gem 'factory_bot_rails' 
gem 'rspec-rails'

run bundle install

rails generate devise:install
rails generate devise:views
rails generate devise User
rails g rspec:install
rails db:create
rails db:migrate
rails generate scaffold Product name:string description:text price:float user:references
rails db:migrate


demo record add in seed file
rails db:seed

product controller
and product view index code minor changes check
routes 