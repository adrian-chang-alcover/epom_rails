class Zone < ActiveRecord::Base
	belongs_to :publisher
	has_many :placements
	validates :publisher_id, presence: true
	acts_as_zone belongs_to: [{:name => 'publisher', :epom_element => 'Site', :model => 'Publisher'}]
end
