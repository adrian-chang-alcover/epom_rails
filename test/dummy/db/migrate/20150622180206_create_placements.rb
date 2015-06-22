class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.integer :epom_id
      t.integer :zone_id
      t.string :type
      t.string :name
      t.integer :ad_unit_id
      t.integer :size_height
      t.integer :size_width

      t.timestamps null: false
    end
  end
end
