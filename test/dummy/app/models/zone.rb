class Zone < ActiveRecord::Base
	acts_as_zone epom_id: 'id', name: 'name', description: 'description', site_id: 'siteId'
end
