require 'spec_helper'

describe Battle do
  describe "create" do
    before do
      @b = Battle.new
      @b.save!
    end
    it{@b.rounds.size.should eq(0)}
  end
end
