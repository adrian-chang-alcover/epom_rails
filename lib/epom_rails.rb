require 'epom'
require 'epom_rails/acts_as'

module EpomRails
	attr_accessor :epom_klass, :epom_fields

	def method_missing(method_name, *args)
		return epom_klass.send(method_name, args[0], args[1]) if epom_klass.respond_to?(method_name)
		super
	end
end