class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.date :date
      t.time :hour
      t.string :advertiser
      t.integer :advertiser_id
      t.string :campaign
      t.integer :campaign_id
      t.string :banner
      t.integer :banner_id
      t.string :site
      t.integer :site_id
      t.string :zone
      t.integer :zone_id
      t.string :placement
      t.integer :placement_id
      t.string :channel
      t.string :country
      t.integer :impressions
      t.integer :clicks
      t.float :ctr
      t.integer :conversions
      t.float :i2c
      t.float :ccr
      t.integer :net
      t.integer :gross
      t.integer :profit
      t.integer :ecpm_net
      t.integer :ecpm_gross
      t.integer :ecpm_profit
      t.string :status

      t.timestamps null: false
    end
  end
end
