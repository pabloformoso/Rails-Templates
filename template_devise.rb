#----------------------------------------------------------------------------
# Choose Javascript Framework
#----------------------------------------------------------------------------
gem "devise"

ask_devise = ask("\r\n\r\nWhat to create User profile no? (yes/no)")
if ask_devise == "yes"
  run 'rails g devise:install'
  run 'rails g devise User'
elsif ask_devise == "no"
  run "echo no users"
else
  run "Enter a valid value"
  askdevise
end