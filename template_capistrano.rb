#----------------------------------------------------------------------------
# Capistrano
#----------------------------------------------------------------------------
if yes?('Install Capistrano on your local system? (yes/no)')
run "sudo gem install capistrano" 
capify!
file 'Capfile', <<-FILE
  load 'deploy' if respond_to?(:namespace) # cap2 differentiator
  Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
  load 'config/deploy'
FILE
end