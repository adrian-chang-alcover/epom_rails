class Zone < ActiveRecord::Base
	belongs_to :publisher
	has_many :placements
	acts_as_zone belongs_to: [{:name => 'publisher', :epom_element => 'Site', :model => 'Publisher'}]
end
