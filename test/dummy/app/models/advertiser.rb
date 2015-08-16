class Advertiser < ActiveRecord::Base
	has_many :campaigns
	acts_as_advertiser

	def self.before_add_a_campaign(callback, advertiser, campaign)
		puts [callback, advertiser, campaign]
	end

	before_add_for_campaigns << proc {|callback, advertiser, campaign| before_add_a_campaign(callback, advertiser, campaign)}

end