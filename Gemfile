# coding: utf-8
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',                   '6.0.3'
gem 'bootstrap-sass',          '3.4.1'
gem 'bcrypt',                  '3.1.13'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'devise'

gem 'faker',          '2.1.2'
gem 'haml-rails',     '1.0.0'
gem 'puma',           '4.3.6'
gem 'sass-rails',     '5.1.0'
gem 'webpacker',      '4.0.7'
gem 'turbolinks',     '5.2.0'
gem 'jbuilder',       '2.9.1'
gem 'bootsnap',       '1.4.5', require: false

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.3.0' # to avoid heavy load on M1 Macbook[1]
  gem 'spring',                '2.1.1' # [1]
  gem 'spring-watcher-listen', '2.0.1'
  # [1] https://github.com/rails/spring/issues/635#issuecomment-806108967
end

# group :test do
#   gem 'capybara',           '3.28.0'
#   gem 'selenium-webdriver', '3.142.4'
#   gem 'webdrivers',         '4.1.2'
# end

group :production do
  gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
