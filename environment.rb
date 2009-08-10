require 'rubygems'
require 'couchrest'
require 'haml'
require 'gchart'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title           => 'The Big Board',                    
                 :author          => 'ryandotsmith',
                 :url_base        => 'http://10.0.1.20:4567/',
                 :url_base_db     => 'http://10.0.1.20:5984/',
                 :db_name         => "the_big_board-#{Sinatra::Base.environment}" 
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

  # prevent Object#id warnings
  Object.send(:undef_method, :id)
end


