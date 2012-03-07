class RoundPoint < ActiveRecord::Base

  def self.update_point(round_id,panelist_id)
    point = Vote.where(:round_id    => round_id ,
                       :panelist_id => panelist_id ).sum(:kind)
    good  = Vote.where(:round_id    => round_id ,
                       :panelist_id => panelist_id ,
                       :kind=> 1 ).count
    bad   = Vote.where(:round_id    => round_id ,
                       :panelist_id => panelist_id ,
                       :kind=> -1 ).count
    unless roud_point = self.where(:round_id => round_id,:panelist_id => panelist_id).first
      roud_point = RoundPoint.new
    end
    roud_point.attributes={:round_id => round_id,
                           :panelist_id => panelist_id,
                           :good => good,
                           :bad => bad,
                           :point => point }
    roud_point.save
  end
end
