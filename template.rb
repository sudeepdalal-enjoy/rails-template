gem 'rubocop', require: false
gem 'rubocop-rails', require: false

gem_group :development, :test do
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'faker'
end

rails_command 'db:system:change --to=postgresql'
after_bundle do
  run "spring stop"
  generate 'rspec:install'
  rails_command("db:migrate") if yes?("Run database migrations?")
end
