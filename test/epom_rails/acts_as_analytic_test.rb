require 'test_helper'

class ActsAsAnalyticTest < ActiveSupport::TestCase
	test 'analytic_from_epom' do
		unless EpomRails.config.offline
			analytics = Analytic.analytic_from_epom({range: 'CURRENT_MONTH'})
			assert_instance_of Array, analytics
			assert_instance_of Analytic, analytics[0] if analytics.count > 0
		end
	end
end