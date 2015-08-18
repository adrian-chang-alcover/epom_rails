class Campaign < ActiveRecord::Base
	belongs_to :advertiser
	has_many :banners
	acts_as_campaign fields: {epom_id: 'id', name: 'name', description: 'description', weight: 'weight', epom_advertiser_id: 'advertiserId'}

	attr_accessor :epom_advertiser_id

	def epom_advertiser_id
		advertiser.epom_id if advertiser
	end
end
