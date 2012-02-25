require 'spec_helper'

describe 'Association Round Vote' do
  describe '1 Round 1 Vote' do
    before do
      @r = Round.new
      @v = Vote.new(:user_id=>1,
                    :panelist_id=>1,
                    :kind=>1)
      @r.votes << @v
      @r.save!
    end

    it{ @r.votes.size.should eq(1) }
    it{ @r.votes.shift.should eq(@v) }
  end
end
