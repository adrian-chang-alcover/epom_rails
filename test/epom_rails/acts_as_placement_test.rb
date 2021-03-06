require 'test_helper'

class ActsAsPlacementTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.placement[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Placement.fancy_method end
	end

	test 'save an placement' do
		unless EpomRails.config.offline
			placement = placements(:two)
			placement.epom_id = nil

	  	assert	placement.save
	  	assert_instance_of Fixnum, placement.send(epom_field('id'))

	  	# testing save_placement
	  	epom_response = Epom::Placement.get_placement_summary({}, {:placementIds => placement.send(epom_field('id'))})
	  	assert_instance_of Array, epom_response
	  	epom_placement = epom_response.find{|a| a['id'] == placement.send(epom_field('id'))}
	  	assert_equal placement.send(epom_field('name')), epom_placement['name']

	  	# # testing update_placement
	  	assert placement.update name: 'otro string'
	  	epom_response = Epom::Placement.get_placement_summary({}, {:placementIds => placement.send(epom_field('id'))})
	  	assert_instance_of Array, epom_response
	  	epom_placement = epom_response.find{|a| a['id'] == placement.send(epom_field('id'))}
	  	assert_equal placement.send(epom_field('name')), epom_placement['name']
	  end
	end

	test 'delete an placement' do
		unless EpomRails.config.offline
			placement = placements(:two)
			placement.epom_id = nil	  	

	  	assert	placement.save
	  	assert_instance_of Fixnum, placement.send(epom_field('id'))

	  	epom_id = placement.send(epom_field('id'))
	  	assert placement.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			placement = placements(:two)
			placement.epom_id = nil	  	

	  	assert	placement.save
	  	assert_instance_of Fixnum, placement.send(epom_field('id'))

			epom_response = Epom::Placement.get_placement_summary({}, {:placementIds => placement.send(epom_field('id'))})
	  	assert_instance_of Array, epom_response
	  end
	end

	test 'key method' do
		unless EpomRails.config.offline
			placement = placements(:two)
			placement.epom_id = nil

	  		assert placement.save
	  		epom_key = placement.epom_key
	  		epom_key = placement.epom_key
	  		assert_equal epom_key, placement.instance_variable_get('@epom_key')
	  	end
	end
end