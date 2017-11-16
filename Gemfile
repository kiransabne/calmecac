source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "alom"
gem "pg"
gem "rails-i18n"
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem "jquery-rails"
gem "jquery-ui-rails"
gem 'devise'
gem "devise-i18n"
gem 'acts-as-taggable-on'
gem "paperclip"
gem 'gioco', git: "https://github.com/thelastinuit/gioco.git"

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "mailcatcher"
  gem "pry"
  gem "pry-byebug"
  gem "reek"
  gem "rspec-rails"
  gem "rubocop"
end

group :test do
  gem "database_cleaner"
  gem "guard-brakeman"
  gem "guard-bundler"
  gem "guard-bundler-audit"
  gem "guard-puma"
  gem "guard-reek"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "i18n-spec"
  gem "rails-controller-testing"
  gem "rspec-collection_matchers"
  gem "shoulda-matchers", "~> 3.1"
  gem "warden-rspec-rails"
end

group :production do
  gem "rails_12factor", group: :production
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
