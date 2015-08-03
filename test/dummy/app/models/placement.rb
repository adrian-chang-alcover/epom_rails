class Placement < ActiveRecord::Base
	belongs_to :zone
	acts_as_placement
end
