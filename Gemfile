source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'rspec-rails', '~>2.6'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'vcr'
  gem 'capybara'
end

group :development do
  gem 'guard-spork'
  gem 'guard-livereload'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
