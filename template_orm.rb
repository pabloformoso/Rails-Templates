#----------------------------------------------------------------------------
# Database
#----------------------------------------------------------------------------
ask_db_type = ask("\r\n\r\nWhich database type would you like to use?\r\n\r\n(1) SQLite\r\n(2) MySQL\r\n(3) PostgreSQL\r\n(4) MongoDB\r\n(1..4):")
if ["1", "2", "3", "4"].include?(ask_db_type)
  sqlite   = (ask_db_type=="1")
  mysql    = (ask_db_type=="2")
  postgres = (ask_db_type=="3")
  mongodb  = (ask_db_type=="4")
else
  puts "Woops! You must enter a number between 1 and 4"
  ask_db_type
end
db_type = ["sqlite3","mysql","postgresql","mongodb"][ask_db_type.to_i - 1]

#----------------------------------------------------------------------------
# ORM
#----------------------------------------------------------------------------
ask_orm_type = ask("\r\n\r\nWhich ORM would you like to use?\n\r\n\r(1) ActiveRecord\n\r(2) MongoMapper")
if %w(1 2).include?(ask_orm_type)
  activerecord = (ask_orm_type==1)  
  mongomapper  = (ask_orm_type==2)  
else
  puts "Woops! You must enter a number between 1 and 2"
  ask_orm_type
end

db_name = ask("\r\n\r\nWhat should I call the database?\r\n\r\n(Leave blank to use application name)")


gem 'mysql2' if mysql
 
 
if sqlite
  file 'config/database.yml', <<-CODE
development:
  adapter: sqlite3
  host: localhost
  database: db/development.sqlite3
  pool: 5
  timeout: 5000
  
test: &TEST
  adapter: #{db_type}
  host: localhost
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: #{db_type}
  host: localhost
  database: db/production.sqlite3
  pool: 5
  timeout: 5000

cucumber:
  <<: *TEST
CODE
else
  file 'config/database.yml', <<-CODE
development:
  adapter: #{db_type}
  host: localhost
  database: #{db_name}_development

test: &TEST
  adapter: #{db_type}
  host: localhost
  database: #{db_name}_test

production:
  adapter: #{db_type}
  host: localhost
  database: #{db_name}_production

cucumber:
  <<: *TEST
CODE
end



#----------------------------------------------------------------------------
#  Sessions
#----------------------------------------------------------------------------
if activerecord
file 'session_store.rb', <<-END
ActionController::Base.session_store = :active_record_store
END
end
if mongomapper
file 'session_store.rb', <<-END
require 'mongo_session_store'
ActionController::Base.session_store = MongoMapper::SessionStore
END
end