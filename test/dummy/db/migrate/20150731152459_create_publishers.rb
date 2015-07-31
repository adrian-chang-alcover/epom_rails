class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :email
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
