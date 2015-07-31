require 'test_helper'

class ActsAsBannerTest < ActiveSupport::TestCase
	def epom_field(field)
		EpomRails.config.banner[:fields].key(field)
	end

	test 'fancy_method' do
	  	assert_raises NoMethodError do Banner.fancy_method end
	end

	test 'save an banner' do
		unless EpomRails.config.offline
			banner = banners(:one)	  	

	  	assert	banner.save
	  	assert_instance_of Fixnum, banner.send(epom_field('id'))
	  end
	end

	test 'delete an banner' do
		unless EpomRails.config.offline
			banner = banners(:one)	  	

	  	assert	banner.save
	  	assert_instance_of Fixnum, banner.send(epom_field('id'))

	  	epom_id = banner.send(epom_field('id'))
	  	assert banner.destroy
	  end
	end

	test 'epom methods' do
		unless EpomRails.config.offline
			banner = banners(:one)	  	

	  	assert	banner.save
	  	assert_instance_of Fixnum, banner.send(epom_field('id'))

			response = Banner.get_banner({:bannerId => banner.send(epom_field('id'))}, {})
			assert_equal banner.campaign_id, response['campaignId']
			assert_equal banner.weight, response['weight']
			assert_equal banner.url, response['url']
			assert_equal banner.name, response['name']
			assert_equal banner.image_banner_link, response['imageBannerLink']		
		end
	end
end