gem 'rubocop', require: false
gem 'rubocop-rails', require: false

gem_group :development, :test do
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'faker'
end

rails_command 'db:system:change --to=postgresql'
