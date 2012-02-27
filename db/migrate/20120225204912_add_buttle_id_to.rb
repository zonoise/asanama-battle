class AddButtleIdTo < ActiveRecord::Migration
  def change
    add_column :panelists , :battle_id ,:integer 
  end
end
