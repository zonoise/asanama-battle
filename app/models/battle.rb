class Battle < ActiveRecord::Base
  has_many :rounds
  has_many :panelists
end
