gem 'rubocop', require: false
gem 'rubocop-rails', require: false

gem_group :development, :test do
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'faker'
end

# added factory initializer
file 'spec/support/factory_bot.rb', <<-CODE

  require 'factory_bot_rails'
    RSpec.configure do |config|
      config.include FactoryBot::Syntax::Methods
    end
CODE


rails_command 'db:system:change --to=postgresql'

after_bundle do
  run "spring stop"
  echo "require_relative './support/factory_bot.rb'" >> spec/spec_helper.rb
  generate 'rspec:install'
  rails_command("db:migrate") if yes?("Run database migrations?")
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
