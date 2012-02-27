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

  describe "vote good 1" do
    before do
      @b=Battle.create
      @p=Panelist.create(:battle_id => @b.id)
      @r=Round.create(:battle_id => @b.id)
      @v=Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>1)
    end
    
    it { Vote.where('panelist_id=? AND round_id=?',
                    @p.id,@r.id).count.should eq(1) 
    }
  end

  describe "vote good 5" do
    before do
      @b=Battle.create
      @p=Panelist.create(:battle_id => @b.id)
      @r=Round.create(:battle_id => @b.id)
      5.times do 
        Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>1)
      end
    end
    it { Vote.where('panelist_id=? AND round_id=?',
                    @p.id,@r.id).count.should eq(5) 
    }
  end

  describe "vote bad " do
    before do
      @b=Battle.create
      @p=Panelist.create(:battle_id => @b.id)
      @r=Round.create(:battle_id => @b.id)
      Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>-1)
      
    end
    it { Vote.where('panelist_id=? AND round_id=? AND kind=?',
                    @p.id,@r.id,-1).count.should eq(1) 
    }
  end

  describe "vote bad 5" do
    before do
      @b=Battle.create
      @p=Panelist.create(:battle_id => @b.id)
      @r=Round.create(:battle_id => @b.id)
      5.times do
        Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>-1)
      end
    end
    it { Vote.where('panelist_id=? AND round_id=? AND kind=?',
                    @p.id,@r.id,-1).count.should eq(5) 
    }
  end

  describe "vote good 5 and bad 5" do
    before do
      @b=Battle.create
      @p=Panelist.create(:battle_id => @b.id)
      @r=Round.create(:battle_id => @b.id)
      5.times do
        Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>-1)
      end
      5.times do
        Vote.create(:user_id=>1 ,:round_id=>@r.id ,:panelist_id=>@p.id,:kind=>1)
      end
    end

    it "cound good" do
      Vote.where('panelist_id=? AND round_id=? AND kind=?',
                    @p.id,@r.id,1).count.should eq(5) 
    end
    it "count bad" do
      Vote.where('panelist_id=? AND round_id=? AND kind=?',
                    @p.id,@r.id,-1).count.should eq(5) 
    end
    it "count point" do 
      Vote.where('panelist_id=? AND round_id=? ',
                    @p.id,@r.id).sum(:kind).should eq(0) 
    end
  end
end
