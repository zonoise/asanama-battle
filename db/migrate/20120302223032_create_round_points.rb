class CreateRoundPoints < ActiveRecord::Migration
  def change
    create_table :round_points do |t|
      t.integer :round_id
      t.integer :panelist_id
      t.integer :good
      t.integer :bad
      t.integer :point

      t.timestamps
    end
  end
end
