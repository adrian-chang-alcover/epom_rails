require 'epom'
require 'epom_rails/acts_as'

module EpomRails
	attr_accessor :epom_klass, :epom_fields

	def method_missing(method_name, *args)
		super
	end
end