require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  #@goals = Goal.all
  haml :index
end

get '/goals' do
  @goals = Goal.all
  @admin = true
  haml :admin
end

get '/goals/new' do
  haml :new
end

post '/goals' do
  goal = Goal.new( params[:goal] )
  goal.save
  redirect '/goals'
end

put '/goal/:goal_id' do
  goal = Goal.find params[:goal_id] 
  goal.update_attributes( params[:goal] )
  redirect '/goals'
end

delete '/goal/:goal_id' do 
  goal = Goal.by_name.select { |g| g.id == params[:goal_id] }
  goal.first.destroy
  redirect '/goals'
end

get '/calendar' do
  haml :calendar
end
