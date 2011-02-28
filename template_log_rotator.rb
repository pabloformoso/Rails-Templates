#----------------------------------------------------------------------------
# Rotate log files (50 files max at 1MB each)
#----------------------------------------------------------------------------
log_path = '#{Rails.root}/log/#{Rails.env}.log'
gsub_file 'config/application.rb', /(< Rails::Application.*)/ , "\\1\n config.logger = 
Logger.new(\"#{log_path}\", 50, 1048576)"