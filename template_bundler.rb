#----------------------------------------------------------------------------
# Bundle the Bundler
#----------------------------------------------------------------------------
run "mkdir gems && mkdir gems/bundler"
inside 'gems/bundler' do  
  run 'git init'
  run 'git pull --depth 1 git://github.com/wycats/bundler.git' 
  run 'rm -rf .git .gitignore'
end