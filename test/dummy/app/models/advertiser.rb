class Advertiser < ActiveRecord::Base
	acts_as_advertiser epom_id: 'id', name: 'name', contact_name: 'contactName', contact_email: 'contactEmail', description: 'description', has_many: [{:name => 'campaigns', :class_name => 'Campaign'}]
end
