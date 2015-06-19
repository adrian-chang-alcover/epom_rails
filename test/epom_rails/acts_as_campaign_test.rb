require 'test_helper'

class ActsAsCampaignTest < ActiveSupport::TestCase
	def epom_field(field)
		Campaign.epom_fields.key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Campaign.fancy_method end
	end

	test 'save an campaign' do
		campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))
	end

	test 'delete an campaign' do
		campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))

	  	epom_id = campaign.send(epom_field('id'))
	  	assert campaign.destroy
	end

	test 'epom methods' do
		campaign = campaigns(:one)	  	

	  	assert	campaign.save
	  	assert_instance_of Fixnum, campaign.send(epom_field('id'))

		response = Campaign.get_campaign({:campaignId => campaign.send(epom_field('id'))}, {})
		assert_equal campaign.send(epom_field('id')), response['id']
		assert_equal campaign.send(epom_field('name')), response['name']
		
	end
end