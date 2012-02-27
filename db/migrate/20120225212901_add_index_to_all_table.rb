class AddIndexToAllTable < ActiveRecord::Migration
  def change
    add_index :panelists , :battle_id
    add_index :rounds    , :battle_id
    add_index :votes     , :round_id
    add_index :votes     , :panelist_id
  end
end
