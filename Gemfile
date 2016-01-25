source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgres as the database for Active Record
gem 'pg'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Create API documentation
gem 'apipie-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveModel::Serializers
gem 'active_model_serializers'

# Use Carrierwave for image processing
gem 'carrierwave'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

group :production do
  # Enable deployment to Heroku
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'

  # Use RSpec as the testing framework
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Better Rails development console
  gem 'pry'
end
