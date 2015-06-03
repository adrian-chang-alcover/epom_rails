require 'epom'
require 'epom_rails/acts_as'

module EpomRails
	def method_missing(method_name, *args)
		puts method_name
		super
	end
end