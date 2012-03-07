class Panelist < ActiveRecord::Base
  belongs_to :battle
  has_many :votes

  def update_good
    self[:good] = Vote.where('panelist_id=? AND kind=?',self[:id],1).count(:id)
    self.save
  end

  def update_bad
    self[:bad] = Vote.where('panelist_id=? AND kind=?',self[:id],-1).count(:id)
    self.save
  end

  def update_point
    self.point= Vote.where('panelist_id=?',self.id).sum(:kind)
    self.save
  end
end
