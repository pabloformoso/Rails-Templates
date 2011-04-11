# Your path here
TEMPLATE_PATH = "/Users/pablo/Dropbox/Proyectos/Rails-Templates"

run "echo TODO > README"

run "echo Cleaning up files..."
apply "#{TEMPLATE_PATH}/template_cleanup.rb"

run "echo Configuring JS..."
apply "#{TEMPLATE_PATH}/template_js.rb"

run "echo Configuring log rotator..."
apply "#{TEMPLATE_PATH}/template_log_rotator.rb"

run "echo Chosing ORM system..."
apply "#{TEMPLATE_PATH}/template_orm.rb"

run "echo Configuring Git..."
apply "#{TEMPLATE_PATH}/template_git.rb"

run "echo Configuring Capistrano"
apply "#{TEMPLATE_PATH}/template_capistrano.rb"

# require gems
gem 'cucumber-rails'
gem 'database_cleaner'
gem 'capybara'

gem "meta_where"
gem "meta_search"

# generate Cucumber infrastructure
run "echo Creating Cucumbers..."
run 'rails g cucumber'

run 'bundle install'

    

