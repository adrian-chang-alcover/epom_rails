class Advertiser < ActiveRecord::Base
	acts_as Epom::Advertiser, {:epom_id => 'id', :name => 'name', :contact_name => 'contactName', :contact_email => 'contactEmail', :description => 'description'}
end
