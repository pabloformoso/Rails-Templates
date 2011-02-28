run "echo TODO > README"

run "echo Cleaning up files..."
apply "./template_cleanup.rb"

run "echo Configuring JS..."
apply "./template_js.rb"

run "echo Configuring log rotator..."
apply "./template_log_rotator.rb"

run "echo Chosing ORM system..."
apply "./template_orm.rb"

run "echo Configuring Git..."
apply "./template_git.rb"

run "echo Configuring Capistrano"
apply "./template_capistrano.rb"

# require gems
gem 'cucumber-rails'
gem 'database_cleaner'
gem 'capybara'

gem 'mysql2'

gem "meta_where"
gem "meta_search"

# generate Cucumber infrastructure
run "echo Creating Cucumbers..."
run 'rails g cucumber'

run 'bundle install'

    

