source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'devise_token_auth'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'figaro'
gem 'rack-cors'
gem 'pundit'
gem 'rack-attack'
gem 'redis-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'brakeman', require: false
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'rspec-collection_matchers'
  gem 'timecop'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
