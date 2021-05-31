# README

Ruby version: 3.0.0

Additional gems used:
gem 'devise'
gem 'pg', '~> 1.1'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'rails-assets-jcrop', source: 'https://rails-assets.org'
gem 'pry'
gem 'aws-sdk-s3', require: false

Database: Postgresql

Note that the current setup of the storage.yml is such that the project uses my Amazon AWS account for storage. To cahnge the storage to local disk, go to App > Config > Environments and change the `line config.active_storage.service = :amazon` from development.rb and production.rb to `config.active_storage.service = :local`
