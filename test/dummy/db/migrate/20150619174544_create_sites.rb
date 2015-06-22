class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :epom_id
      t.string :name
      t.string :url
      t.text :description
      t.string :email
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
