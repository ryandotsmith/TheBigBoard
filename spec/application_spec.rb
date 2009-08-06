require "#{File.dirname(__FILE__)}/spec_helper"

describe "The Big Board" do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify "should show the default index page" do
    get '/'
    last_response.should be_ok
    last_response.body.should have_tag('title', /#{SiteConfig.title}/)
  end

end

