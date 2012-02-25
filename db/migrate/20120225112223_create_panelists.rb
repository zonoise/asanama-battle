class CreatePanelists < ActiveRecord::Migration
  def change
    create_table :panelists do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :good
      t.integer :bad
      t.integer :point

      t.timestamps
    end
  end
end
