require "#{File.dirname(__FILE__)}/spec_helper"

describe "Goals" do

  before(:each) do
    @goal = Goal.new
  end
  
  it "should require a expectation" do
    @goal.should_not be_valid
  end

end
