require "#{File.dirname(__FILE__)}/spec_helper"

describe "CRUD Goals" do

  before(:each) do
    @goal = Goal.new
  end
  
  specify "should require a expectation" do
    @goal.should_not be_valid
  end
  
  specify "should be valid with the required attributes" do
    @goal = Goal.new( valid_attr )
    @goal.should be_valid
  end
  
  specify "require that names are unique" do
    
  end

  specify "should return a collection of goals " do
    Goal.new( valid_attr ).save 
    Goal.all.count.should eql( 1 )
  end

  specify "should upate the goal " do
    goal = Goal.new valid_attr
    goal.save
    goal.update_attributes( :name  => 'marketing' )
    goal.name.should eql( 'marketing' )
  end

  specify "delete a goal" do
    goal = Goal.new( valid_attr )
    goal.save
    Goal.all.count.should eql( 1 ) 
    goal.destroy
    Goal.all.count.should eql( 0 )
  end
end

describe "Making a Google Chart from the goal" do

  before(:each) do 
    @goal = Goal.new( valid_attr )
  end

  specify "calling google's API with the goal's data " do
    Gchart.should_receive( :bar )
    @goal.chart 
  end
  
end

describe "Searching for a goal" do
  before(:each) do
    @goal = Goal.new( valid_attr )
  end
  it "should select a goal by id " do
    @goal.save
    Goal.find( @goal.id ).should eql( @goal )
  end
end


def valid_attr
    { 
      :name  => "sales",
      :expectation  => "100",
      :actual  => "50"
    }
end
