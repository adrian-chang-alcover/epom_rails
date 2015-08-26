require 'test_helper'

class ActsAsAnalyticTest < ActiveSupport::TestCase
	test 'analytic_from_epom' do
		Analytic.analytic_from_epom
		byebug
	end
end