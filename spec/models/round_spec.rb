require 'spec_helper'

describe Round do
  describe "create" do
    before do
      @r = Round.new
      @r.save!
    end
    it{@r.should be_true}
  end

  describe "current round" do
    before do
      battle_id=1
      time_now = DateTime.new(2001,1,10,12,10)
      Timecop.freeze(time_now)
      Round.create!(:battle_id=>battle_id,:start=>DateTime.new(2001,1,10,12,00),:end=>DateTime.new(2001,1,10,12,30))
      Round.create!(:battle_id=>battle_id,:start=>DateTime.new(2001,1,10,12,30),:end=>DateTime.new(2001,1,10,13,00))
      @current = Round.now(battle_id)
    end

    it{@current.id.should be_true}
    it{@current.start.should < DateTime.now }
    it{@current.end.should >= DateTime.now }
  end
end
