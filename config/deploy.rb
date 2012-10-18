set :application, "Worker Tester"
set :repository,  "."

require 'rvm/capistrano'
set :rvm_ruby_string, 'ruby-1.9.3-p286'
set :rvm_type, :user

require 'bundler/capistrano'

set :scm, :git
set :deploy_via, :copy
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, '/var/www'

server "192.168.4.45", :app, :web, :db, primary: true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end