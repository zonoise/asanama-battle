class SetDefaultPanelist < ActiveRecord::Migration
  def change
    change_column :panelists ,:good  ,:integer ,:default => 0
    change_column :panelists ,:bad   ,:integer ,:default => 0
    change_column :panelists ,:point ,:integer ,:default => 0
  end
end
