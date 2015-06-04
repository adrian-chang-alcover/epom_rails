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

	  	# epom_response = 
	end
end