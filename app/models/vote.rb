class Vote < ActiveRecord::Base
  belongs_to :round 
  belongs_to :panelist
  def good
    self.kind = 1
  end

  def bad
    self.kind = -1
  end
end
