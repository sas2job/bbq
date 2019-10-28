source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Devise for authentication
gem 'devise'
# Bootstrap 4 ruby gem for Ruby on Rails
gem 'bootstrap', '~> 4.3.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Slim is a Ruby template language
gem 'slim'
# Translations for the devise gem
gem 'devise-i18n'
# Russian language support for Ruby and Rails
gem 'russian'
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'lightbox-bootstrap-rails', '5.1.0.1'
gem 'coffee-rails', '~> 5.0.0'

group :production do
  gem 'pg'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen'
  gem 'pry-rails'
  gem 'awesome_print', :require => 'ap'
  # A web interface for browsing Ruby on Rails sent emails
  # gem 'letter_opener_web'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
