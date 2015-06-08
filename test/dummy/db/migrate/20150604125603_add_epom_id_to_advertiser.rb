class AddEpomIdToAdvertiser < ActiveRecord::Migration
  def change
    add_column :advertisers, :epom_id, :integer
  end
end
