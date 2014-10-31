source 'https://rubygems.org'
ruby '2.1.3'

gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'unicorn'
gem 'sane_week', '>= 0.0.3'
gem 'font-awesome-rails'

group :production do
  gem 'rails_12factor' # for heroku
end

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'rails_admin'

group :development do
  gem 'rspec-rails', '>=2.12.0'
  gem 'guard-rspec', '1.2.1'
  gem 'rspec-its', '>= 0.0.1.pre'

  gem "railroady"
  gem "better_errors"
  gem "binding_of_caller"

  gem 'brakeman', :require => false
  gem 'awesome_print', :require => false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "spring-commands-rspec"

  gem 'pry'
  gem 'pry-doc', '>= 0.6.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '4.2.1'
end
