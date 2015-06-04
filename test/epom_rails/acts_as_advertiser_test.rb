require 'test_helper'

class ActsAsAdvertiserTest < ActiveSupport::TestCase
	def epom_field(field)
		Advertiser.epom_fields.key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Advertiser.fancy_method end
	end

	test 'save and update an advertiser' do
		advertiser = advertisers(:one)	  	

	  	advertiser.save
	  	assert_instance_of Fixnum, advertiser.send(epom_field('id'))

	  	# testing save_advertiser
	  	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	  	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	  	assert_equal "Is Owner", epom_advertiser['shareType']

	  	# testing update_advertiser
	  	advertiser.name = 'otro string'
	  	advertiser.save
	  	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	  	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	  	assert_equal "Is Owner", epom_advertiser['shareType']	  	
	end
end