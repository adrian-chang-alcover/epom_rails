class Advertiser < ActiveRecord::Base
	has_many :campaigns
	acts_as_advertiser
end
