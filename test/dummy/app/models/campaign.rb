class Campaign < ActiveRecord::Base
	acts_as_campaign epom_id: 'id', name: 'name', description: 'description', advertiser_id: 'advertiserId', weight: 'weight'
end
