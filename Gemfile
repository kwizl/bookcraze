source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.5'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'mini_magick', '~> 4.10', '>= 4.10.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop-rails'
  gem 'rspec-core', '~> 3.9', '>= 3.9.2'
  gem 'capybara', '~> 3.32', '>= 3.32.2'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
   gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails', '~> 5.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'webdrivers'
  gem 'rspec'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
