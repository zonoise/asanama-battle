require 'spec_helper'
require 'panelist'

describe Panelist do
  describe "Create correct record" do
    before do
      @panelist = Panelist.new(:name=>'asanama taro')
      @panelist.save! 
    end
    it{ @panelist.should_not be_new_record }
  end

  describe "vote " do
    before do 
      @panelist = Panelist.new(:name=>'asanama taro')
      @panelist.save!
      @panelist.increment(:good)
      @panelist.increment(:bad)
      @panelist.increment(:point , by=2)
    end
    it { @panelist.good.should eq(1) }
    it { @panelist.bad.should eq(1) }
    it { @panelist.point.should eq(2) }
  end

end
