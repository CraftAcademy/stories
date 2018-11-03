source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'rails', '5.2.1'
gem 'pg'
gem 'puma'
gem 'railties'
gem 'i18n-js'
gem 'newrelic_rpm'

# Auth
gem 'devise'
gem 'omniauth-facebook', '~> 4.0'
# gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

# Front-end
gem 'react-rails', '1.10.0'
gem 'react-rails-img'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'font-awesome-sass'
gem 'uglifier'
gem 'autoprefixer-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 2.5', '>= 2.5.4'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'jbuilder', '~> 2.7'
gem 'browser'

gem 'friendly_id', '~> 5.2', '>= 5.2.3'

# Merit and Badges
gem 'merit', '~> 3.0', '>= 3.0.2'

# Image upload
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'net-ssh'
gem 'sdoc', group: :doc

# Load will_paginate before elasticsearch gems.
gem 'will_paginate'

# Elasticsearch
gem 'elasticsearch'
gem 'elasticsearch-transport'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# Background Job
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
# gem 'sidetiq', '~> 0.7.0'

gem 'nokogiri'

# Caching
gem 'dalli'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'awesome_print'
  gem 'bundler-audit', '~> 0.6.0'
  gem 'pry-rails'
  gem 'redis_test'
  gem 'redis-namespace'
end

group :development do
  gem 'rails_best_practices'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'spring'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'rack-mini-profiler', require: false
  gem 'annotate'
  gem 'bullet'
  gem 'dotenv-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
end

group :production do
  gem 'bonsai-elasticsearch-rails'
end
