require 'test_helper'

class AnalyticsControllerTest < ActionController::TestCase
  setup do
    @analytic = analytics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analytics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analytic" do
    assert_difference('Analytic.count') do
      post :create, analytic: { advertiser: @analytic.advertiser, advertiser_id: @analytic.advertiser_id, banner: @analytic.banner, banner_id: @analytic.banner_id, campaign: @analytic.campaign, campaign_id: @analytic.campaign_id, ccr: @analytic.ccr, channel: @analytic.channel, clicks: @analytic.clicks, conversions: @analytic.conversions, country: @analytic.country, ctr: @analytic.ctr, date: @analytic.date, ecpm_gross: @analytic.ecpm_gross, ecpm_net: @analytic.ecpm_net, ecpm_profit: @analytic.ecpm_profit, gross: @analytic.gross, hour: @analytic.hour, i2c: @analytic.i2c, impressions: @analytic.impressions, net: @analytic.net, placement: @analytic.placement, placement_id: @analytic.placement_id, profit: @analytic.profit, site: @analytic.site, site_id: @analytic.site_id, status: @analytic.status, zone: @analytic.zone, zone_id: @analytic.zone_id }
    end

    assert_redirected_to analytic_path(assigns(:analytic))
  end

  test "should show analytic" do
    get :show, id: @analytic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analytic
    assert_response :success
  end

  test "should update analytic" do
    patch :update, id: @analytic, analytic: { advertiser: @analytic.advertiser, advertiser_id: @analytic.advertiser_id, banner: @analytic.banner, banner_id: @analytic.banner_id, campaign: @analytic.campaign, campaign_id: @analytic.campaign_id, ccr: @analytic.ccr, channel: @analytic.channel, clicks: @analytic.clicks, conversions: @analytic.conversions, country: @analytic.country, ctr: @analytic.ctr, date: @analytic.date, ecpm_gross: @analytic.ecpm_gross, ecpm_net: @analytic.ecpm_net, ecpm_profit: @analytic.ecpm_profit, gross: @analytic.gross, hour: @analytic.hour, i2c: @analytic.i2c, impressions: @analytic.impressions, net: @analytic.net, placement: @analytic.placement, placement_id: @analytic.placement_id, profit: @analytic.profit, site: @analytic.site, site_id: @analytic.site_id, status: @analytic.status, zone: @analytic.zone, zone_id: @analytic.zone_id }
    assert_redirected_to analytic_path(assigns(:analytic))
  end

  test "should destroy analytic" do
    assert_difference('Analytic.count', -1) do
      delete :destroy, id: @analytic
    end

    assert_redirected_to analytics_path
  end
end
