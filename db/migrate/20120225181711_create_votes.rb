class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id    , :null=>false
      t.integer :round_id   , :null=>false
      t.integer :panelist_id, :null=>false
      t.integer :kind       , :null=>false

      t.timestamps
    end
  end
end
