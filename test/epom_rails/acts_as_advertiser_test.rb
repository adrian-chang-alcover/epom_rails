require 'test_helper'

class ActsAsAdvertiserTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.advertiser[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Advertiser.fancy_method end
	end

	test 'save an advertiser' do
		unless EpomRails.config.offline
			advertiser = advertisers(:one)	  	

	  	assert	advertiser.save
	  	assert_instance_of Fixnum, advertiser.send(epom_field('id'))

	  	# testing save_advertiser
	  	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	  	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	  	assert_equal "Is Owner", epom_advertiser['shareType']

	  	# testing update_advertiser
	  	assert advertiser.update name: 'otro string'
	  	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	  	assert_instance_of Array, epom_response
	  	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	  	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	  	assert_equal "Is Owner", epom_advertiser['shareType']	  	
	  end
	end

	test 'delete an advertiser' do
		unless EpomRails.config.offline
			advertiser = advertisers(:one)	  	

	  	assert	advertiser.save
	  	assert_instance_of Fixnum, advertiser.send(epom_field('id'))

	  	epom_id = advertiser.send(epom_field('id'))
	  	assert advertiser.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			response = Advertiser.get_advertisers_tree({}, {})

			assert_instance_of Array, response
			if response.count > 0
				first = response[0]
				assert_instance_of Fixnum, first['id']
				assert_instance_of Array, first['category']
				assert_instance_of String, first['name']
				assert_instance_of Array, first['campaigns']

				advertiser = first
				response = Advertiser.get_campaigns_for_advertiser({:advertiserId => advertiser['id']}, {})
				assert_instance_of Array, response
				if response.count > 0
					first = response[0]
					assert_instance_of Fixnum, first['id']
					assert_instance_of String, first['name']
				end
			end
		end
	end
end