require 'test_helper'

class ActsAsZoneTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.zone[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Zone.fancy_method end
	end

	test 'save an zone' do
		unless EpomRails.config.offline
			zone = zones(:two)
			zone.epom_id = nil	  	

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

	   	# testing update_zone
	  	assert zone.update name: 'otro string'
	  end
	end

	test 'delete an zone' do
		unless EpomRails.config.offline
			zone = zones(:two)
			zone.epom_id = nil		

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

	  	epom_id = zone.send(epom_field('id'))
	  	assert zone.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			zone = zones(:two)
			zone.epom_id = nil	

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

			response = Zone.get_zone_placements({:zoneId => zone.send(epom_field('id'))}, {})
			assert_instance_of Array, response	
		end
	end

end