require "#{File.dirname(__FILE__)}/spec_helper"

describe "Loading Goals on The Big Board" do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify "should show the default index page" do
    get '/'
    last_response.should be_ok
    last_response.body.should have_tag('title', /#{SiteConfig.title}/)
  end
  
  specify "should load an array of goals on the index page" do
    array = []
    array << Goal.new( valid_attr )
    Goal.should_receive(:all).once.and_return array
    get '/'
  end
  
  specify "getting a form to create a new goal" do
    get '/goals/new'
    last_response.body.should have_tag( 'form' )
    last_response.body.should have_tag( 'input' )
  end

  specify "creating a new goal" do
    goal = mock( Goal )
    parameters = { 'goal' => {'name'  => 'sales ads', 'expectation'  => '100', 'actual'  => '50'} }
    Goal.should_receive( :new ).with( parameters['goal'] ).and_return( goal )
    goal.should_receive( :save ) 
    post '/goals', parameters
  end
  
  specify "updating a goal" do
    Goal.new( valid_attr ).save
    goal = mock( Goal )
    updated_attr = { 'goal' => { 'name' => "updatedness" } }
    Goal.should_receive( :find ).and_return( goal )
    goal.should_receive( :id ).and_return( Goal.all.first.id )
    goal.should_receive( :update_attributes ).with( updated_attr['goal'] )
    put "/goal/#{ goal.id }", updated_attr 
  end

  specify "deleting a goal" do 
    goal = Goal.new valid_attr
    goal.save
    delete "/goal/#{goal.id}"
  end

end

def valid_attr
    { 
      :name  => "sales",
      :expectation  => "100",
      :actual  => "50"
    }
end
