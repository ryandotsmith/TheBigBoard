load 'deploy' if respond_to?(:namespace) # cap2 differentiator

default_run_options[:pty] = true

# be sure to change these
set :user, 'rsmith'
set :domain, "10.0.1.20"
set :application, 'TheBigBoard'

# the rest should be good
set :repository,  "git@github.com:ryandotsmith/TheBigBoard.git" 
set :deploy_to, "/var/app/#{ application }" 
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end

