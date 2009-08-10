require 'rubygems'
require 'sinatra'
require 'application'

#set :run, false
set :app_file,    File.join(root_dir, 'application.rb')
set :environment, :production
disable :run

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
