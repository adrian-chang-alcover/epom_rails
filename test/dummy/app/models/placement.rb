class Placement < ActiveRecord::Base
	belongs_to :zone
	validates :zone_id, presence: true
	acts_as_placement
end
