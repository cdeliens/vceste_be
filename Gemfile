source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :development, :test do
  gem 'mysql2'
end

group :production do
  gem 'pg'
  gem 'thin'
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "pry"
  gem "pry-remote"
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'guard-coffeescript'
  
end

gem "httparty"
gem "koala", "~> 1.7.0rc1"
gem 'instagram'
gem 'twitter'
gem 'jquery-rails'
gem "haml-rails"
gem 'inherited_resources'
gem 'kaminari'
gem 'formtastic', '~> 2.0.0'
gem 'has_scope'


group :test do
  gem "rspec-rails", "= 2.9"
  gem "factory_girl_rails"
  gem 'faker'
  gem 'shoulda-matchers'
end
