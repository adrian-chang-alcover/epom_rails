class Advertiser < ActiveRecord::Base
	acts_as Epom::Advertiser, {:name => 'name', :contact_name => 'contactName', :contact_email => 'contactEmail', :description => 'description'}
end
