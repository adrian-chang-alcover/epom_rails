require 'test_helper'

class ActsAsAdvertiserTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.advertiser[:fields].key(field)
	end

	def check_campaigns_list(campaigns1, campaigns2)
		assert_equal campaigns1.count, campaigns2.count
		campaigns1.each do |campaign|
			epom_campaign = campaigns2.find{|c| c['id'] == campaign.send(epom_field('id'))}
			assert epom_campaign
			assert_instance_of Hash, epom_campaign
			assert_equal campaign.name, epom_campaign['name']
		end
	end

	# test 'fancy_method' do
	#   assert_raises NoMethodError do Advertiser.fancy_method end
	# end

	# test 'save an advertiser' do
	# 	unless EpomRails.config.offline
	# 		advertiser = advertisers(:one)	  	

	#   	assert	advertiser.save
	#   	assert_instance_of Fixnum, advertiser.send(epom_field('id'))

	#   	# testing save_advertiser
	#   	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	#   	assert_instance_of Array, epom_response
	#   	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	#   	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	#   	assert_equal "Is Owner", epom_advertiser['shareType']

	#   	# testing update_advertiser
	#   	assert advertiser.update name: 'otro string'
	#   	epom_response = Epom::Advertiser.get_advertiser_permissions_for_user({}, {})
	#   	assert_instance_of Array, epom_response
	#   	epom_advertiser = epom_response.find{|a| a['id'] == advertiser.send(epom_field('id'))}
	#   	assert_equal advertiser.send(epom_field('name')), epom_advertiser['name']
	#   	assert_equal "Is Owner", epom_advertiser['shareType']	  	
	#   end
	# end

	# test 'delete an advertiser' do
	# 	unless EpomRails.config.offline
	# 		advertiser = advertisers(:one)	  	

	#   	assert	advertiser.save
	#   	assert_instance_of Fixnum, advertiser.send(epom_field('id'))

	#   	epom_id = advertiser.send(epom_field('id'))
	#   	assert advertiser.destroy
	#   end
	# end

	# test 'epom methods' do
	# 	unless EpomRails.config.offline
	# 		response = Advertiser.get_advertisers_tree({}, {})

	# 		assert_instance_of Array, response
	# 		if response.count > 0
	# 			first = response[0]
	# 			assert_instance_of Fixnum, first['id']
	# 			assert_instance_of Array, first['category']
	# 			assert_instance_of String, first['name']
	# 			assert_instance_of Array, first['campaigns']

	# 			advertiser = first
	# 			response = Advertiser.get_campaigns_for_advertiser({:advertiserId => advertiser['id']}, {})
	# 			assert_instance_of Array, response
	# 			if response.count > 0
	# 				first = response[0]
	# 				assert_instance_of Fixnum, first['id']
	# 				assert_instance_of String, first['name']
	# 			end
	# 		end
	# 	end
	# end

	test 'define_before_add_and_before_remove_for_campaigns' do
		a1 = Advertiser.create(name: 'advertiser 1')
		a2 = Advertiser.create(name: 'advertiser 2')
		c = Campaign.create(name: 'campaign', advertiser_id: a2.send(epom_field('id')))

		puts 'a1.campaigns << c'
		a1.campaigns << c
		unless EpomRails.config.offline
			# TODO: replace for a1.get_campaigns_for_advertiser
			campaigns = Advertiser.get_campaigns_for_advertiser({advertiserId: a1.send(epom_field('id'))})
			check_campaigns_list(a1.campaigns, campaigns)
		end

		puts 'a2.campaigns << c'
		a2.campaigns << c
		unless EpomRails.config.offline
			# TODO: replace for a1.get_campaigns_for_advertiser
			campaigns = Advertiser.get_campaigns_for_advertiser({advertiserId: a1.send(epom_field('id'))})
			check_campaigns_list(a1.campaigns, campaigns)

			# TODO: replace for a2.get_campaigns_for_advertiser
			campaigns = Advertiser.get_campaigns_for_advertiser({advertiserId: a2.send(epom_field('id'))})
			check_campaigns_list(a2.campaigns, campaigns)
		end

		puts 'a2.campaigns = [Campaign.create, Campaign.create]'
		a2.campaigns = [Campaign.create, Campaign.create]
		assert_nil c.advertiser_id
		unless EpomRails.config.offline
			# TODO: replace for a2.get_campaigns_for_advertiser
			campaigns = Advertiser.get_campaigns_for_advertiser({advertiserId: a2.send(epom_field('id'))})
			check_campaigns_list(a2.campaigns, campaigns)
		end

		puts 'a2.campaigns = []'
		a2.campaigns = []
		unless EpomRails.config.offline
			# TODO: replace for a2.get_campaigns_for_advertiser
			campaigns = Advertiser.get_campaigns_for_advertiser({advertiserId: a2.send(epom_field('id'))})
			check_campaigns_list(a2.campaigns, campaigns)
		end
	end
end