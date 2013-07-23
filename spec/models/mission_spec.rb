require File.dirname(__FILE__) + '/../spec_helper'

describe Mission do
  it "should be valid" do
    Mission.new.should be_valid
  end
end
