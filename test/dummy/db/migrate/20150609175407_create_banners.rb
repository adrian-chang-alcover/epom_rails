class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :epom_id
      t.string :placement_type
      t.integer :campaign_id
      t.integer :weight
      t.string :image_banner_link
      t.string :url
      t.string :name
      t.string :banner_type
      t.integer :ad_unit_id
      t.integer :ad_unit_width
      t.integer :ad_unit_height

      t.timestamps null: false
    end
  end
end
