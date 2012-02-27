require 'spec_helper'

describe 'Association Battle Panelist' do
  describe '1 Battle 1 Panelist' do
    before do
      @b = Battle.new
      @p = Panelist.new(:battle_id=>@b.id)
      @b.panelists << @p
      @b.save!
    end

    it{ @b.panelists.size.should eq(1) }
    it{ @b.panelists[0].should eq(@p) }
    it{ @p.battle.should eq(@b) }
  end
end
