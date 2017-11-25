source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "acts-as-taggable-on"
gem "alom"
gem "aws-sdk-s3"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "devise-i18n"
gem "gioco", git: "https://github.com/thelastinuit/gioco.git"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "paperclip"
gem "pg"
gem "puma", "~> 3.7"
gem "pundit"
gem "rails", "~> 5.1.4"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "capybara", "~> 2.13"
  gem "factory_bot_rails"
  gem "faker"
  gem "mailcatcher"
  gem "pry"
  gem "pry-byebug"
  gem "reek"
  gem "rspec-rails"
  gem "rubocop"
  gem "scss_lint", require: false
  gem "selenium-webdriver"
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
  gem "pundit-matchers"
  gem "rails-controller-testing"
  gem "rspec-collection_matchers"
  gem "shoulda-matchers", "~> 3.1"
  gem "warden-rspec-rails"
  gem "simplecov", require: false
end

group :production do
  gem "rails_12factor", group: :production
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
