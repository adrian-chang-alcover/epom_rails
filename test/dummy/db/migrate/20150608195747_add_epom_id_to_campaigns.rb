class AddEpomIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :epom_id, :integer
  end
end
