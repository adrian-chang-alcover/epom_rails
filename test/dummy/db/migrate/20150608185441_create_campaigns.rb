class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :advertiser_id
      t.text :description
      t.integer :wight

      t.timestamps null: false
    end
  end
end
