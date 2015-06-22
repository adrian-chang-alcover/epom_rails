require 'test_helper'

class ActsAsZoneTest < ActiveSupport::TestCase
	def epom_field(field)
		Zone.epom_fields.key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Zone.fancy_method end
	end

	test 'save an zone' do
		zone = zones(:one)	  	

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

	   	# testing update_zone
	  	assert zone.update name: 'otro string'
	end

	test 'delete an zone' do
		zone = zones(:one)	  	

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

	  	epom_id = zone.send(epom_field('id'))
	  	assert zone.destroy
	end

	test 'epom methods' do
		zone = zones(:one)	  	

	  	assert	zone.save
	  	assert_instance_of Fixnum, zone.send(epom_field('id'))

		response = Zone.get_zone_placements({:zoneId => zone.send(epom_field('id'))}, {})
		assert_instance_of Array, response	
	end
end