class Campaign < ActiveRecord::Base
	belongs_to :advertiser
	has_many :banners
	acts_as_campaign
end
