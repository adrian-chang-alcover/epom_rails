require 'test_helper'

class ActsAsCampaignTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.campaign[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Campaign.fancy_method end
	end

	test 'save an campaign' do
		unless EpomRails.config.offline
			campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))
	  end
	end

	test 'delete an campaign' do
		unless EpomRails.config.offline
			campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))

	  	epom_id = campaign.send(epom_field('id'))
	  	assert campaign.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))

			response = Campaign.get_campaign({:campaignId => campaign.send(epom_field('id'))}, {})
			assert_equal campaign.send(epom_field('id')), response['id']
			assert_equal campaign.send(epom_field('name')), response['name']
		end		
	end

	test 'method_missing' do
		campaign = campaigns(:one)
		assert campaign.advertiser_id, campaign.advertiserId
	end

end