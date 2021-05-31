# README

Ruby version: 3.0.0

Additional gems used:
<br>gem 'devise' <br />
<br>gem 'pg', '\~> 1.1'<br />
<br>gem 'mini_magick'<br />
<br>gem 'image_processing', '\~> 1.2'<br />
<br>gem 'rails-assets-jcrop', source: 'https://rails-assets.org'<br />
<br>gem 'pry'<br />
<br>gem 'aws-sdk-s3', require: false<br />



Database: Postgresql

Note that the current setup of the storage.yml is such that the project uses my Amazon AWS account for storage. To cahnge the storage to local disk, go to App > Config > Environments and change the `line config.active_storage.service = :amazon` from development.rb and production.rb to `config.active_storage.service = :local`


TODO:
<br>Add Jcrop for cropping images on upload<br />
<br>Use bootstrap for carousel on images<br />
<br>Redo UI<br />
<br>(maybe) Move from bootstrap to react<br />
<br> Add editing title functionality for posts and galleries <br />
