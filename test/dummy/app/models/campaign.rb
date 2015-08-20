class Campaign < ActiveRecord::Base
	belongs_to :advertiser
	has_many :banners
	validates :advertiser_id, presence: true
	acts_as_campaign
end
