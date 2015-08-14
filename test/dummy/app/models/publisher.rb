class Publisher < ActiveRecord::Base
	has_many :zones
	acts_as_site
end
