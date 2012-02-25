require 'spec_helper'

describe Vote do
  describe "create" do
    before do
      @v=Vote.new(:user_id=>1,
                  :round_id=>1,
                  :panelist_id=>1,
                  :kind=>1)
    end
    it{ @v.save.should be_true }
  end

  describe "error on save" do
    before do
      @v=Vote.new
    end
    it { lambda { @v.save! }.should raise_exception }
  end
end
