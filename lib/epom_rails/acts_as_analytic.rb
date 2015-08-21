class ActiveRecord::Base 
	def self.acts_as_advertiser(params = {})
		EpomRails.config.advertiser[:model] = self
	end
end