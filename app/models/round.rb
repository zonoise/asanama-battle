class Round < ActiveRecord::Base
  belongs_to :battle
  has_many :votes

  def self.now(battle_id)
    now=Time.now
    rounds = Round.where('battle_id=?',battle_id).order('start ASC')
    for r in rounds
      if r.start <= now && r.end > now
        return r
      end
    end
  end
end
