source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development

gem 'pg', group: :production

gem 'rails_12factor', group: :production

group :development do #for N+1 queries and blah blah
  gem "bullet"
  gem "ruby-growl"
  gem "xmpp4r"
  gem 'rack-mini-profiler'
  gem 'letter_opener'
end

group :test, :development do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

gem 'buttercms-rails'

gem 'masonry-rails'

gem "rails-erd"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'devise'
gem "seo_helper", "~> 1.0.2"
gem "open_graph_helper"

gem "rmagick"
gem "mini_magick"
gem "carrierwave"
gem "carrierwave-meta"
gem "fog-aws"

gem "settingslogic"

gem "anjlab-bootstrap-rails", "2.3.1.2", :require => "bootstrap-rails"
gem "bootstrap_helper", ">= 4.2.2.1"
gem "simple_form", "~> 3.0.1" 
gem "will_paginate", "3.0.3"
gem "font-awesome-rails", "~> 3.2.1.3"

gem "high_voltage"

gem "airbrake"

gem "rvm-capistrano"

gem "omniauth"
gem "omniauth-facebook"
gem "auto-facebook", "0.42"


#gem "whenever"

gem "hipchat"

# Cache
gem "dalli"

gem "compass-rails", "~> 1.1.2"

group :development do
  gem "capistrano"
  gem "capistrano-ext"
  gem "cape"
  gem "binding_of_caller"
  gem "better_errors", "~> 0.9.0"
  gem "magic_encoding"
  gem "annotate"
  gem "powder"
  gem "pry-nav"
  gem "pry-remote"
end


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

