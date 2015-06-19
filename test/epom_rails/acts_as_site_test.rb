require 'test_helper'

class ActsAsSiteTest < ActiveSupport::TestCase
	def epom_field(field)
		Site.epom_fields.key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Site.fancy_method end
	end

	test 'save an site' do
		site = sites(:one)	  	

	  	assert	site.save
	  	assert_instance_of Fixnum, site.send(epom_field('id'))

	  	# testing save_site
	  	epom_response = Epom::Site.get_sites({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_site = epom_response.find{|a| a['id'] == site.send(epom_field('id'))}
	  	assert_equal site.send(epom_field('name')), epom_site['name']

	  	# # testing update_site
	  	assert site.update name: 'otro string'
	  	epom_response = Epom::Site.get_sites({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_site = epom_response.find{|a| a['id'] == site.send(epom_field('id'))}
	  	assert_equal site.send(epom_field('name')), epom_site['name']
	end
end