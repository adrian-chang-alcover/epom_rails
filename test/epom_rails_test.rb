require 'test_helper'

class EpomRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, EpomRails
  end

  test 'acts_as_advertiser' do
  	advertiser = advertisers(:one)

  	assert_raises NoMethodError do Advertiser.fancy_method end
  	
  	advertiser.save
  end
end
