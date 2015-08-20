class Banner < ActiveRecord::Base
	belongs_to :campaign
	validates :campaign_id, presence: true
	acts_as_banner
end
