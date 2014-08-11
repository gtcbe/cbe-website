source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.5'
gem 'bootstrap-sass', '>= 3.0'
gem 'sprockets'
gem 'bcrypt-ruby'
gem 'ckeditor'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"

gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"

group :development, :production do
	gem 'mysql'
end

group :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'
	# Use rspec for tests
	gem 'rspec-rails'
	gem 'selenium-webdriver'
	gem 'capybara'
end

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'acts_as_votable', '~> 0.9.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end