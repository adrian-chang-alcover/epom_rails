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
	attr_accessor :epom_klass, :epom_fields

	def method_missing(method_name, *args)
		if not EpomRails.config.offline and epom_klass.respond_to?(method_name)
			epom_klass.send(method_name, args[0], args[1])
		else
			super
		end
	end
end