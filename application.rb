require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  @goals = Goal.all
  haml :index
end

get '/goals' do
  @goals = Goal.all
  @admin = true
  haml :index
end

get '/goals/new' do
  haml :new
end

post '/goals' do
  goal = Goal.new( params[:goal] )
  goal.save
  @goals = Goal.all
  haml :index
end

put '/goal/:goal_id' do
  goal = Goal.by_name.select { |g| g.id == params[:goal_id] }
  goal.first.update_attributes( params[:goal] )
end

delete '/goal/:goal_id' do 
  goal = Goal.by_name.select { |g| g.id == params[:goal_id] }
  goal.first.destroy
  @goals = Goal.all
  haml :index
end


