class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
