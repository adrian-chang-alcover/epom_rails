require 'epom'
require 'epom_rails/acts_as'

module EpomRails
	attr_accessor :epom_klass, :epom_fields

	Epom::EpomElement.login(ENV['username'], ENV['password'])

	def method_missing(method_name, *args)
		if epom_klass.respond_to?(method_name)
			epom_klass.send(method_name, args[0], args[1])
		else
			super
		end
	end
end