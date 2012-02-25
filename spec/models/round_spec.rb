require 'spec_helper'

describe Round do
  describe "create" do
    before do
      @r = Round.new
      @r.save!
    end
    it{@r.should be_true}
  end
end
