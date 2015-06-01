require 'test_helper'

class EpomRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, EpomRails
  end

  test 'acts_as_advertiser' do
  	advertiser = Advertiser.new
  	assert_equal 'abc', advertiser.abc
  end
end
