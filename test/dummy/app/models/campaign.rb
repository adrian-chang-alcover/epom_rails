class Campaign < ActiveRecord::Base
	acts_as_campaign epom_id: 'id', name: 'name', description: 'description', advertiser_id: 'advertiser_id', weight: 'weight'
end
