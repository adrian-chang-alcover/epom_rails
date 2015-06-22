class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.integer :epom_id
      t.string :name
      t.text :description
      t.integer :site_id

      t.timestamps null: false
    end
  end
end
