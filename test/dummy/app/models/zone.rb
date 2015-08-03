class Zone < ActiveRecord::Base
	acts_as_zone belongs_to: [{:name => 'publisher', :epom_element => 'Site', :model => 'Publisher'}]
end
