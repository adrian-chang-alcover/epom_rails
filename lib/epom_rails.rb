require 'epom'
require 'epom_rails/acts_as'
require 'epom_rails/acts_as_advertiser'
require 'epom_rails/acts_as_campaign'
require 'epom_rails/acts_as_banner'
require 'epom_rails/acts_as_site'
require 'epom_rails/acts_as_zone'
require 'epom_rails/acts_as_placement'

require 'epom_rails/config'

module EpomRails
	def method_missing(method_name, *args)
		if not EpomRails.config.offline and epom_class.respond_to?(method_name)
			# this permits to use:
			# Campaign.get_campaign({:campaignId => campaign.send(epom_field('id'))}, {})
			epom_class.send(method_name, *args)
		else
			super
		end
	end

	def epom_class
		return Epom::Advertiser if EpomRails.config.advertiser[:model] == self
		return Epom::Campaign if EpomRails.config.campaign[:model] == self
		return Epom::Banner if EpomRails.config.banner[:model] == self
		return Epom::Site if EpomRails.config.site[:model] == self
		return Epom::Zone if EpomRails.config.zone[:model] == self
		return Epom::Placement if EpomRails.config.placement[:model] == self
	end
end