#----------------------------------------------------------------------------
# Choose Javascript Framework
#----------------------------------------------------------------------------
run 'mkdir public/uploads && chmod 777 public/uploads'
run 'mkdir public/ui'

ask_js = ask("\r\n\r\nWhat javascript framework do you want to use?\r\n\r\n(1) Prototype\r\n(2) jQuery\r\n(3) MooTools\r\n(4) RightJS")
if ["1", "2", "3", "4"].include?(ask_js)
  @prototype  = (ask_js=="1")
  @jquery     = (ask_js=="2")
  @mootools   = (ask_js=="3")
  @rightjs    = (ask_js=="4")
else
  puts "Woops! You must enter a number between 1 and 4"
  ask_js
end

js_framework = [:all,"jquery","mootools","rightjs"][ask_js.to_i - 1]

if !@prototype
  run 'rm public/javascripts/controls.js'
  run 'rm public/javascripts/dragdrop.js'
  run 'rm public/javascripts/effects.js'
  run 'rm public/javascripts/prototype.js'
end

if @jquery
  run "curl -L http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js > public/javascripts/jquery.js"
end

if @mootools
  run "curl -L http://mootools.net/download/get/mootools-1.2.4-core-yc.js > public/javascripts/mootools.js"
end

if @rightjs
  run "curl -L http://rightjs.org/builds/current/right-min.js > public/javascripts/right.js"
  run "curl -L http://rightjs.org/builds/current/right-olds-min.js > public/javascripts/right-olds.js"
end

# add XHTML 1.0 Strict layout, with jQuery from Google
file 'app/views/layouts/application.html.erb', <<-ERB
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>Application!</title>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  <script src="https˙://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js" type="text/javascript"></script>
  <%= stylesheet_link_tag 'global' %>
</head>
<body>
  <%= yield %>
</body>
</html>
ERB