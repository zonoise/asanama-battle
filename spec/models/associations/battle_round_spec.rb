require 'spec_helper'

describe 'Association Battle Round' do
  describe '1 Battle 1 Round' do
    before do
      @b = Battle.new
      @r = Round.new
      @b.rounds << @r
      @b.save!
    end

    it{ @b.rounds.size.should eq(1) }
    it{ @r.battle.should eq(@b) }
  end
end
