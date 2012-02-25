class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :battle_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
