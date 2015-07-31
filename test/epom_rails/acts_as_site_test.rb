require 'test_helper'

class ActsAsSiteTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.site[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Publisher.fancy_method end
	end

	test 'save an site' do
		unless EpomRails.config.offline
			site = publishers(:one)	  	

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

	test 'delete an site' do
		unless EpomRails.config.offline
			site = publishers(:one)	  	

	  	assert	site.save
	  	assert_instance_of Fixnum, site.send(epom_field('id'))

	  	epom_id = site.send(epom_field('id'))
	  	assert site.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			site = publishers(:one)	  	

		  	assert	site.save
		  	assert_instance_of Fixnum, site.send(epom_field('id'))

			response = Site.get_sites_zones({:siteId => site.send(epom_field('id'))}, {})
			assert_instance_of Array, response	
		end
	end
end